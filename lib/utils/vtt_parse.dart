import 'dart:convert';
import 'dart:math';

import 'package:new_cognisong/core/injection_container.dart';
import 'package:new_cognisong/domain/entities/module.dart';
import 'package:new_cognisong/domain/usecases/user/user_get_song_level_info_usecase.dart';
import 'package:new_cognisong/domain/usecases/user/user_get_song_lyric_info_usecase.dart';
import 'package:http/http.dart' as http;

class LyricEntry {
  final String lyric;
  final int line;
  final int idx;
  final bool isMission;

  LyricEntry(this.lyric, this.line, this.isMission, {this.idx = 0});
}

class VttParse {
  int getLyricsIndexAtPosition(
    Duration position,
    List<MapEntry<Duration, LyricEntry>> lyricEntries,
  ) {
    for (int i = 0; i < lyricEntries.length; i++) {
      if (position < lyricEntries[i].key) {
        return i > 0 ? i - 1 : -1;
      }
    }
    return lyricEntries.length - 1;
  }

  int getLyricsLineAtPosition(Duration position) {
    return mapDurationToLine(position);
  }

  Future<List<MapEntry<Duration, LyricEntry>>> loadLyrics(
    String url,
    int? line, {
    bool isChangeLyrics = false,
    bool isInitConsonant = false,
    Map<int, String> changeLyrics = const {},
    bool isModuleTutorial = false,
  }) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final bytes = response.bodyBytes;
      final vttString = utf8.decode(bytes);
      return await parseLyrics(
        vttString,
        line,
        isChangeLyrics,
        isInitConsonant,
        changeLyrics,
        isModuleTutorial,
      );
    } else {
      throw Exception('Failed to load lyrics from URL: $url');
    }
  }

  Future<Map<int, String>> changeLyrics(
    Module module, {
    bool tutorial = false,
    int? songLevel,
    int? songId,
  }) async {
    final Map<int, String> result = {};
    final songLyricInfo = songId == null
        ? await getIt<UserGetSongLyricInfoUseCase>().execute(module)
        : await getIt<UserGetSongLyricInfoUseCase>().execute(
            module,
            songId: songId,
          );

    final songLevelInfo = songLevel == null
        ? await getIt<UserGetSongLevelInfoUseCase>().execute(module)
        : await getIt<UserGetSongLevelInfoUseCase>().execute(
            module,
            songLevel: songLevel,
          );

    final getList = getRandomNumbersWithoutDuplication(
      tutorial == false ? songLevelInfo!.count : songLyricInfo!.total,
      songLyricInfo!.total,
    );

    for (int t = 0; t < getList.length; t++) {
      final newEntry = <int, String>{
        getList[t]: songLyricInfo.changeLyric[getList[t]]!,
      };
      result.addEntries(newEntry.entries);
    }
    return result;
  }

  List<int> getRandomNumbersWithoutDuplication(int count, int total) {
    if (count < total) {
      final random = Random();
      final numbers = List.generate(total, (index) => index + 1);
      numbers.shuffle(random);
      return numbers.sublist(0, count);
    } else {
      final numbers = List.generate(total, (index) => index + 1);
      return numbers;
    }
  }

  String getInitialConsonants(String word) {
    return word.replaceAllMapped(
      RegExp(r'[가-힣]'),
      (match) => String.fromCharCode(
        ((match.group(0)!.codeUnitAt(0) - 0xAC00) / 28 / 21).floor() + 0x1100,
      ),
    );
  }

  Future<List<MapEntry<Duration, LyricEntry>>> parseLyrics(
    String lyricsData,
    int? line,
    bool isChangeLyrics,
    bool isInitConsonant,
    Map<int, String> changeLyrics,
    bool isModuleTutorial,
  ) async {
    List<MapEntry<Duration, LyricEntry>> entries = [];
    final RegExp pattern = RegExp(
      r'(\d{2}:\d{2}:\d{2}\.\d{3}) --> (\d{2}:\d{2}:\d{2}\.\d{3})\n([\s\S]*?)(?=\n\n|$)',
      multiLine: true,
    );
    Iterable<Match> matches = pattern.allMatches(lyricsData);
    List<Match> matchesList = matches.toList();
    int idx = 0;
    for (int i = 0; i < matchesList.length; i++) {
      Match match = matchesList[i];
      bool isMission = false;
      String startTimeStr = match.group(1)!;
      String lyrics = match.group(3)!.trim();
      // print(lyrics);
      String modifiedLyrics = lyrics;
      if (isChangeLyrics) {
        for (String word in changeLyrics.values) {
          if (modifiedLyrics.contains(word)) {
            isMission = true;
            idx += 1;
            if (isModuleTutorial == false) {
              final changeWord = isInitConsonant
                  ? getInitialConsonants(word)
                  : '_' * word.length;
              String updatedLyrics = modifiedLyrics.replaceAll(
                word,
                changeWord,
              );

              if (updatedLyrics != modifiedLyrics) {
                modifiedLyrics = updatedLyrics;
                break;
              }
            } else {
              final changeWord = '_${word}_';

              String updatedLyrics = modifiedLyrics.replaceAll(
                word,
                changeWord,
              );

              if (updatedLyrics != modifiedLyrics) {
                modifiedLyrics = updatedLyrics;
                break;
              }
            }
          }
        }
      }
      Duration startTime = parseDuration(startTimeStr);

      entries.add(
        MapEntry(
          startTime,
          LyricEntry(
            modifiedLyrics,
            line ?? mapDurationToLine(startTime),
            isMission,
            idx: isMission ? idx : 0,
          ),
        ),
      );
    }

    return entries;
  }

  int mapDurationToLine(Duration duration) {
    int totalSeconds = duration.inSeconds;
    int totalMilliseconds = duration.inMilliseconds;

    if (totalSeconds < 30) {
      return 1;
    } else if (totalMilliseconds <= 46000) {
      return 2;
    } else if (totalMilliseconds <= 60790) {
      return 3;
    } else {
      return 4;
    }
  }

  Duration parseDuration(String durationStr) {
    List<String> parts = durationStr.split(':');
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);
    List<String> secondsParts = parts[2].split('.');
    int seconds = int.parse(secondsParts[0]);
    int milliseconds = int.parse(secondsParts[1]);

    return Duration(
      hours: hours,
      minutes: minutes,
      seconds: seconds,
      milliseconds: milliseconds,
    );
  }
}
