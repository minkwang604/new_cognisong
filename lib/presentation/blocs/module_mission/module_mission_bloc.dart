import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:new_cognisong/core/constants/icon_url.dart';
import 'package:new_cognisong/domain/entities/mission_submit.dart';
import 'package:new_cognisong/domain/entities/module.dart';
import 'package:new_cognisong/domain/entities/song_parse.dart';
import 'package:new_cognisong/domain/entities/user_stat.dart';
import 'package:new_cognisong/domain/usecases/mission/post_mission_picture_usecase.dart';
import 'package:new_cognisong/domain/usecases/mission/post_mission_submit_usecase.dart';
import 'package:new_cognisong/domain/usecases/song/get_song_mr_parse_list_usecase.dart';
import 'package:new_cognisong/domain/usecases/song/get_song_parse_list_usecase.dart';
import 'package:new_cognisong/domain/usecases/user/user_get_song_level_info_usecase.dart';
import 'package:new_cognisong/domain/usecases/user/user_update_user_stat_usecase.dart';
import 'package:new_cognisong/presentation/pages/module_mission/view/module_mission_view.dart';
import 'package:new_cognisong/utils/audio_service.dart';
import 'package:new_cognisong/utils/vtt_parse.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui' as ui;

import 'package:path_provider/path_provider.dart';

part 'module_mission_event.dart';
part 'module_mission_state.dart';

class ModuleMissionBloc extends Bloc<ModuleMissionEvent, ModuleMissionState> {
  ModuleMissionBloc({
    required PostMissionSubmitUsecase postMissionSubmitUsecase,
    required AudioService audioService,
    required VttParse vttParse,
    required GetSongParseListUsecase getSongParseListUsecase,
    required UserGetSongLevelInfoUseCase userGetSongLevelInfoUseCase,
    required PostMissionPictureUsecase postMissionPictureUsecase,
    required int order,
    required UserUpdateUserStatUsecase updateUserStatUsecase,
    required GetSongMrParseListUsecase getSongMrParseListUsecase,
    required bool isPractice,
  }) : _audioService = audioService,
       _vttParse = vttParse,
       _getSongParseListUsecase = getSongParseListUsecase,
       _userGetSongLevelInfoUseCase = userGetSongLevelInfoUseCase,
       _postMissionPictureUsecase = postMissionPictureUsecase,
       _getSongMrParseListUsecase = getSongMrParseListUsecase,
       _postMissionSubmitUsecase = postMissionSubmitUsecase,
       _order = order,
       _isPractice = isPractice,
       _updateUserStatUsecase = updateUserStatUsecase,
       super(ModuleMissionInitState()) {
    on<InitModuleMissionEvent>((event, emit) async {
      await _audioService.startAndWait(AssetSource('guides/32.wav'));
      await Future.delayed(const Duration(seconds: 1));
      add(
        LoadedModuleTutorialEvent(
          songId: event.songId,
          songLevel: event.songLevel,
        ),
      );
    });
    on<LoadedModuleTutorialEvent>((event, emit) async {
      emit(ModuleMissionLoadedState());
      final song = event.songId == null
          ? await _getSongParseListUsecase.execute()
          : await _getSongParseListUsecase.execute(songId: event.songId);

      final songMrList = event.songId == null
          ? await _getSongMrParseListUsecase.execute()
          : await _getSongMrParseListUsecase.execute(songId: event.songId);

      final changeLyrics = event.songId == null
          ? await _vttParse.changeLyrics(Module.B, tutorial: false)
          : await _vttParse.changeLyrics(
              Module.B,
              tutorial: false,
              songId: event.songId,
              songLevel: event.songLevel,
            );
      // print(changeLyrics);

      List<String> sortedLyrics(Map<int, String> changeLyrics) =>
          Map.fromEntries(
            changeLyrics.entries.toList()
              ..sort((a, b) => a.key.compareTo(b.key)),
          ).values.toList();

      if (song == null) {
        emit(ModuleMissionFailureState());
      } else {
        final songId = song.songParseList[0].songId;
        List<List<MapEntry<Duration, LyricEntry>>> lyricsList =
            event.songLevel == null
            ? await getSongParseDrawVttList(song.songParseList, changeLyrics)
            : await getSongParseDrawVttList(
                song.songParseList,
                changeLyrics,
                songLevel: event.songLevel,
              );

        emit(
          (state as ModuleMissionLoadedState).copyWith(
            wordList: sortedLyrics(changeLyrics),
          ),
        );
        final nowState = state as ModuleMissionLoadedState;

        // for (int t=0;t<)

        for (int k = 0; k < lyricsList.length; k++) {
          final lyrics = lyricsList[k];
          final missionEntires = lyrics
              .where((entry) => entry.value.isMission)
              .toList();
          final songMr = songMrList!.songParseMrList[k].mrUrl;

          if (missionEntires.isEmpty) {
            emit(
              (state as ModuleMissionLoadedState).copyWith(
                lyricEntries: lyrics,
                isMissionLyric: false,
              ),
            );
            await _audioService.startAndWait(AssetSource('guides/07.wav'));
            await _audioService.startAndWait(UrlSource(songMr));
          } else {
            for (int t = 1; t < missionEntires.length + 1; t++) {
              count += 1;
              final lyricState = nowState.copyWith(
                lyricEntries: lyrics,
                word: missionEntires[t - 1].value.lyric,
                wordStep: t,
                isDrawStart: true,
                isMissionLyric: true,
              );

              emit(lyricState);

              final guide = switch (t) {
                1 => 'guides/25.wav',
                2 => 'guides/26.wav',
                3 => 'guides/27.wav',
                _ => '',
              };

              await _audioService.startAndWait(AssetSource(guide), second: 1);
              await _audioService.startAndWait(AssetSource('guides/28.wav'));
              await _audioService.startAndWait(UrlSource(songMr));

              final newState = state as ModuleMissionLoadedState;
              emit(newState.copyWith(canClickFinish: true));

              await Future.any([
                Future.delayed(const Duration(minutes: 5)),
                stream.firstWhere((state) {
                  return (state is ModuleMissionDrawSuccessState) ||
                      (state is ModuleMissionDrawFailureState);
                }),
              ]);
              await Future.delayed(const Duration(seconds: 3));
              emit(nowState);
            }
          }
        }
        final isAdmin =
            _isPractice == false &&
                event.songId != null &&
                event.songLevel != null
            ? true
            : false;
        add(
          CompleteDrawAllModuleMissionEvent(
            changeLyrics: changeLyrics,
            songId: songId,
            isAdmin: isAdmin,
            isPractice: _isPractice,
          ),
        );
      }
    });
    on<RemoveDrawModuleMissionEvent>((event, emit) async {
      if (state is ModuleMissionLoadedState) {
        emit((state as ModuleMissionLoadedState).copyWith(lines: []));
      }
    });
    on<StartDrawModuleMissionEvent>((event, emit) async {
      if (state is ModuleMissionLoadedState) {
        final nowLines = (state as ModuleMissionLoadedState).lines;
        emit(
          (state as ModuleMissionLoadedState).copyWith(
            lines: [
              ...nowLines,
              [event.offset],
            ],
          ),
        );
      }
    });
    on<DrawingDrawModuleMissionEvent>((event, emit) async {
      if (state is ModuleMissionLoadedState) {
        final nowLine = (state as ModuleMissionLoadedState).lines.last;
        final nowLines = (state as ModuleMissionLoadedState).lines;
        final checkLine = nowLines.sublist(0, nowLines.length - 1);

        final newLine = [...nowLine, event.offset];
        final newLines = [...checkLine, newLine];
        emit((state as ModuleMissionLoadedState).copyWith(lines: newLines));
      }
    });
    on<CompleteDrawModuleMissionEvent>((event, emit) async {
      if (state is ModuleMissionLoadedState) {
        final nowState = state as ModuleMissionLoadedState;
        emit(ModuleMissionLoadingState());
        final newFile = await saveDrawingAsImage(nowState.lines);
        final newWord = nowState.wordList[count];

        final s3Url = iconS3Url[newWord]!;
        final url = iconsUrl[newWord]!;
        final check = await _postMissionPictureUsecase.execute(newFile, s3Url);
        // 확인 함수
        if (check != null) {
          if (check.similarity >= 0.53) {
            emit(
              ModuleMissionDrawSuccessState(url: url, lines: nowState.lines),
            );
            await _audioService.startAndWait(AssetSource('guides/29.wav'));
          } else {
            emit(
              ModuleMissionDrawFailureState(url: url, lines: nowState.lines),
            );
            await _audioService.startAndWait(AssetSource('guides/30.wav'));
          }

          totalData[newWord] = check.similarity;
        } else {
          emit(ModuleMissionFailureState());
        }
      }
    });
    on<CompleteDrawAllModuleMissionEvent>((event, emit) async {
      emit(ModuleMissionLoadingState());
      final totalSum =
          (totalData.values
              .reduce((value, element) => value + element)
              .toDouble() /
          totalData.length);
      final response = event.isAdmin
          ? MissionSubmitResponse(score: totalSum)
          : await _postMissionSubmitUsecase.execute(
              MissionSubmit(
                order: _order,
                createdAt: startTime,
                type: 'B',
                missionWord: Map.fromEntries(
                  event.changeLyrics.entries.map(
                    (entry) => MapEntry(entry.key.toString(), entry.value),
                  ),
                ),
                song: _isPractice ? -1 : event.songId,
                pictureScore: Map.fromEntries(
                  totalData.entries.map(
                    (entry) => MapEntry(entry.key.toString(), entry.value),
                  ),
                ),
              ),
            );
      if (response == null) {
        emit(ModuleMissionFailureState());
      } else {
        if (event.isPractice) {
          await _updateUserStatUsecase.execute(
            UpdateUserStat(isPracticed: true),
          );
        }

        final num = (() {
          if (response.score >= 0.95) {
            return 1;
          } else if (response.score >= 0.85) {
            return 2;
          } else if (response.score >= 0.75) {
            return 3;
          } else if (response.score >= 0.5) {
            return 4;
          } else {
            return 5;
          }
        })();

        // final info = switch (num) {
        //   1 => '완벽해요! 전부 다 맞추셨어요!',
        //   2 => '훌륭합니다! 다음에도 화이팅 하세요!',
        //   3 => '잘 하셨어요! 다음에도 열심히 해봐요!',
        //   4 => '조금만 더 하면 될 것 같아요. 화이팅',
        //   5 => '다시 차근차근 해 보아요.',
        //   _ => '',
        // };

        final info = switch (num) {
          1 => '완벽해요! 다음 단계로 넘어갑니다.',
          2 => '훌륭합니다! 다음 단계로 넘어갑니다.',
          3 => '잘 하셨어요! 다음 단계로 넘어갑니다.',
          4 => '조금만 더 하면 될 것 같아요. 다시 도전!',
          5 => '아쉽네요, 이전 단계부터 차근차근 해 보아요.',
          _ => '',
        };

        final infoUrl = switch (num) {
          1 => 'guides/new_20.wav',
          2 => 'guides/new_19.wav',
          3 => 'guides/new_18.wav',
          4 => 'guides/new_17.wav',
          5 => 'guides/new_16.wav',
          _ => '',
        };

        emit(ModuleMissionSuccessState(info: info, isAdmin: event.isAdmin));
        await _audioService.startAndWait(AssetSource(infoUrl), second: 3);

        event.isAdmin ? null : emit(ModuleMissionAllSuccessState());
      }
    });
    on<AudioResumeModuleMissionEvent>((event, emit) async {
      _audioService.resume();
    });
    on<AudioPauseModuleMissionEvent>((event, emit) async {
      _audioService.pause();
    });
    on<AudioStopModuleMissionEvent>((event, emit) async {
      _audioService.stop();
    });
  }

  Map<String, num> totalData = {};
  int count = -1;
  Future<File> saveDrawingAsImage(List<List<Offset>> lines) async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    final painter = DrawingPainter(lines);
    painter.paint(canvas, const Size(1000, 1000));
    final picture = recorder.endRecording();

    final img = await picture.toImage(1000, 1000);
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
    final buffer = byteData!.buffer.asUint8List();

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/signature.png');
    await file.writeAsBytes(buffer);

    return file;
  }

  Future<List<List<MapEntry<Duration, LyricEntry>>>> getSongParseDrawVttList(
    List<SongParse> songParseList,
    Map<int, String> changeLyrics, {
    int? songLevel,
  }) async {
    List<List<MapEntry<Duration, LyricEntry>>> newList = [];
    final songLevelInfo = songLevel == null
        ? await _userGetSongLevelInfoUseCase.execute(Module.B)
        : await _userGetSongLevelInfoUseCase.execute(
            Module.B,
            songLevel: songLevel,
          );
    for (int k = 1; k < 5; k++) {
      final lyrics = await _vttParse.loadLyrics(
        songParseList[k - 1].vttUrl,
        k,
        isChangeLyrics: true,
        isInitConsonant: songLevelInfo!.isInitConsonant,
        changeLyrics: changeLyrics,
        isModuleTutorial: false,
      );
      newList.add(lyrics);
    }
    return newList;
  }

  final startTime = DateTime.now();
  final UserGetSongLevelInfoUseCase _userGetSongLevelInfoUseCase;
  final PostMissionSubmitUsecase _postMissionSubmitUsecase;
  final GetSongParseListUsecase _getSongParseListUsecase;
  final GetSongMrParseListUsecase _getSongMrParseListUsecase;
  final PostMissionPictureUsecase _postMissionPictureUsecase;
  final UserUpdateUserStatUsecase _updateUserStatUsecase;
  final AudioService _audioService;
  final VttParse _vttParse;
  final int _order;
  final bool _isPractice;
}
