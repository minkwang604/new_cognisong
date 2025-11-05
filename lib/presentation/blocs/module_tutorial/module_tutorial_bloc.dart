import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:new_cognisong/core/constants/icon_url.dart';
import 'package:new_cognisong/domain/entities/module.dart';
import 'package:new_cognisong/domain/usecases/mission/post_mission_picture_usecase.dart';
import 'package:new_cognisong/presentation/pages/module_tutorial/view/module_tutorial_draw_view.dart';
import 'package:equatable/equatable.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:new_cognisong/domain/entities/song.dart';
import 'package:new_cognisong/domain/entities/song_parse.dart';
import 'package:new_cognisong/domain/entities/song_parse_mr.dart';
import 'package:new_cognisong/domain/usecases/song/get_song_mr_parse_list_usecase.dart';
import 'package:new_cognisong/domain/usecases/song/get_song_parse_list_usecase.dart';
import 'package:new_cognisong/domain/usecases/song/get_song_usecase.dart';
import 'package:new_cognisong/utils/audio_service.dart';
import 'package:new_cognisong/utils/vtt_parse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';

part 'module_tutorial_event.dart';
part 'module_tutorial_state.dart';

class ModuleTutorialBloc
    extends Bloc<ModuleTutorialEvent, ModuleTutorialState> {
  ModuleTutorialBloc({
    required PostMissionPictureUsecase postMissionPictureUsecase,
    required ModuleTutorialState initState,
    required AudioService audioService,
    required VttParse vttParse,
    required GetSongUseCase getSongUseCase,
    required GetSongMrParseListUsecase getSongMrParseListUsecase,
    required GetSongParseListUsecase getSongParseListUsecase,
  }) : _audioService = audioService,
       _vttParse = vttParse,
       _getSongUseCase = getSongUseCase,
       _getSongMrParseListUsecase = getSongMrParseListUsecase,
       _getSongParseListUsecase = getSongParseListUsecase,
       _postMissionPictureUsecase = postMissionPictureUsecase,
       super(initState) {
    on<PreInitModuleTutorialEvent>((event, emit) async {
      emit(const ModuleTutorialPreInitState(step: 0));
      await _audioService.startAndWait(
        AssetSource('guides/new_3.wav'),
        second: 1,
      );
      add(InitModuleTutorialEvent(step: 1));
    });
    on<InitModuleTutorialEvent>((event, emit) async {
      if (event.step == 4) {
        emit(ModuleTutorialAllSuccessState(step: event.step));
      }
      emit(ModuleTutorialInitState(step: event.step));
      String guide = switch (event.step) {
        1 => 'guides/03.wav',
        2 => 'guides/06.wav',
        3 => 'guides/11.wav',
        // 4 => 'guides/24.wav',
        _ => '',
      };
      await _audioService.startAndWait(AssetSource(guide), second: 4);
      if (event.step < 4) {
        add(LoadedAModuleTutorialEvent(step: event.step));
      }
      // else if (event.step == 4) {
      //   // await Future.delayed(const Duration(seconds: 4));
      //   add(LoadedBModuleTutorialEvent());
      // }
    });
    on<LoadedAModuleTutorialEvent>((event, emit) async {
      emit(ModuleTutorialLoadedState(step: event.step));

      final song = await switch (event.step) {
        1 => _getSongUseCase.execute(),
        2 => _getSongParseListUsecase.execute(),
        3 => _getSongUseCase.execute(),
        _ => null,
      };

      if (song == null) {
        emit(ModuleTutorialFailureState(step: event.step));
      } else {
        List<List<MapEntry<Duration, LyricEntry>>> lyricsList = switch (event
            .step) {
          1 => [await _vttParse.loadLyrics((song as Song).vttUrl, null)],
          2 => await getSongParseVttList((song as SongParseList).songParseList),
          3 => [await _vttParse.loadLyrics((song as Song).vttUrl, null)],
          _ => [],
        };
        final newSong = await _getSongMrParseListUsecase.execute();
        // lyricsList.length
        for (int k = 0; k < lyricsList.length; k++) {
          final lyrics = lyricsList[k];
          final nowState = state as ModuleTutorialLoadedState;
          final title = switch (event.step) {
            1 => '편하게 노래를 들어보세요',
            2 => '노래를 들어보세요',
            3 => '반주에 맞춰서 노래를 불러봐요!',
            _ => '',
          };

          final LyricState = nowState.copyWith(
            title: title,
            lyricEntries: lyrics,
            lyricsLine: event.step == 1 || event.step == 3 ? null : k,
          );

          emit(LyricState);

          final songUrl = switch (event.step) {
            1 => (song as Song).url,
            2 => ((song as SongParseList).songParseList[k]).url,
            3 => (song as Song).mrUrl,
            _ => null,
          };

          final middleGuideUrl = switch (event.step) {
            1 => 'guides/04.wav',
            2 => 'guides/07.wav',
            // 3 => 'guides/11.wav',
            _ => null,
          };

          // 가이드 부터 노래 나오는 부분
          if (middleGuideUrl != null) {
            await _audioService.startAndWait(AssetSource(middleGuideUrl));
          }

          await _audioService.start(UrlSource(songUrl!));
          _audioService.positionChangeEvent((event) async {
            add(PositionChangeModuleTutorialEvent(position: event));
          });
          final fileLength = await _audioService.getDuration();
          emit(
            LyricState.copyWith(totalPosition: fileLength, isAudioStart: true),
          );
          await _audioService.wait();
          _audioService.stopChangEvent();

          if (event.step == 2) {
            final speakSong = newSong!.songParseMrList[k].mrUrl;
            // var elapsedTime = const Duration();
            final updateRecordState = LyricState.copyWith(
              totalPosition: const Duration(),
              isAudioStart: false,
              title: '반주에 맞춰 노래를 불러보세요.',
              lyricPositionIndex: -1,
            );

            emit(updateRecordState);
            await _audioService.startAndWait(AssetSource('guides/08.wav'));

            emit(updateRecordState.copyWith(title: '준비되셨나요?'));
            await _audioService.startAndWait(AssetSource('guides/09.wav'));

            for (int i = 3; i > -1; i--) {
              emit(
                updateRecordState.copyWith(
                  title: '준비되셨나요?',
                  lyricPositionIndex: -1,
                  countDownValue: i,
                ),
              );
              await Future.delayed(const Duration(seconds: 1));
            }

            emit(
              updateRecordState.copyWith(
                title: '노래를 불러보세요!',
                isAudioStart: true,
                totalPosition: fileLength,
                currentPosition: const Duration(),
                lyricPositionIndex: -1,
              ),
            );
            await audioService.start(UrlSource(speakSong));
            _audioService.positionChangeEvent((event) async {
              add(PositionChangeModuleTutorialEvent(position: event));
            });
            await _audioService.wait();
            _audioService.stopChangEvent();
            // await Future.doWhile(() async {
            //   elapsedTime += const Duration(milliseconds: 100);
            //   add(PositionChangeModuleTutorialEvent(position: elapsedTime));
            //   await Future.delayed(const Duration(milliseconds: 100));
            //   return elapsedTime < fileLength!;
            // });
          }

          emit(nowState);
        }
      }

      final lastGuideUrl = switch (event.step) {
        1 => 'guides/new_5.wav',
        2 => 'guides/new_10.wav',
        3 => 'guides/23.wav',
        _ => null,
      };

      emit(ModuleTutorialSuccessState(step: event.step));

      await _audioService.startAndWait(AssetSource(lastGuideUrl!), second: 2);
      add(InitModuleTutorialEvent(step: event.step + 1));
    });
    on<LoadedBModuleTutorialEvent>((event, emit) async {
      emit(const ModuleTutorialLoadedState(step: 4));
      final song = await _getSongParseListUsecase.execute();
      final changeLyrics = await _vttParse.changeLyrics(
        Module.B,
        tutorial: true,
      );
      // print(changeLyrics);
      if (song == null) {
        emit(const ModuleTutorialFailureState(step: 4));
      } else {
        List<List<MapEntry<Duration, LyricEntry>>> lyricsList =
            await getSongParseDrawVttList(song.songParseList, changeLyrics);

        // print(lyricsList);
        final nowState = state as ModuleTutorialLoadedState;
        for (int k = 0; k < lyricsList.length; k++) {
          final lyrics = lyricsList[k];
          final MissionEntires = lyrics
              .where((entry) => entry.value.isMission)
              .toList();

          for (int t = 1; t < MissionEntires.length + 1; t++) {
            final lyricState = nowState.copyWith(
              lyricEntries: lyrics,
              word: MissionEntires[t - 1].value.lyric,
              lyricsLine: k + 1,
              wordStep: t,
              isDrawStart: true,
            );

            emit(lyricState);

            final guide = switch (t) {
              1 => 'guides/25.wav',
              2 => 'guides/26.wav',
              3 => 'guides/27.wav',
              _ => '',
            };
            await _audioService.startAndWait(AssetSource(guide));
            await _audioService.startAndWait(AssetSource('guides/28.wav'));
            final newState = state as ModuleTutorialLoadedState;
            emit(newState.copyWith(canClickFinish: true));

            await Future.any([
              Future.delayed(const Duration(minutes: 5)),
              stream.firstWhere((state) {
                return (state is ModuleTutorialDrawSuccessState) ||
                    (state is ModuleTutorialDrawFailureState);
              }),
            ]);
            await Future.delayed(const Duration(seconds: 7));
            emit(nowState);
          }
        }
      }
      emit(const ModuleTutorialSuccessState(step: 4));
      await _audioService.startAndWait(AssetSource('guides/new_13.wav'));
      add(InitModuleTutorialEvent(step: 5));
    });
    on<PositionChangeModuleTutorialEvent>((event, emit) async {
      if (state is ModuleTutorialLoadedState) {
        final nowState = state as ModuleTutorialLoadedState;
        emit(
          nowState.copyWith(
            currentPosition: event.position,
            lyricPositionIndex: _vttParse.getLyricsIndexAtPosition(
              event.position,
              nowState.lyricEntries,
            ),
            lyricsLine: nowState.step == 1 || nowState.step == 3
                ? _vttParse.getLyricsLineAtPosition(event.position)
                : nowState.lyricsLine,
          ),
        );
      }
    });
    on<PauseAndResumeClickModuleTutorialEvent>((event, emit) async {
      if (state is ModuleTutorialLoadedState) {
        if (await _audioService.isPlaying()) {
          _audioService.pause();
          emit(
            (state as ModuleTutorialLoadedState).copyWith(isAudioStart: false),
          );
        } else {
          _audioService.resume();
          emit(
            (state as ModuleTutorialLoadedState).copyWith(isAudioStart: true),
          );
        }
      }
    });
    on<RemoveDrawModuleTutorialEvent>((event, emit) async {
      if (state is ModuleTutorialLoadedState) {
        emit((state as ModuleTutorialLoadedState).copyWith(lines: []));
      }
    });
    on<StartDrawModuleTutorialEvent>((event, emit) async {
      if (state is ModuleTutorialLoadedState) {
        final nowLines = (state as ModuleTutorialLoadedState).lines;
        emit(
          (state as ModuleTutorialLoadedState).copyWith(
            lines: [
              ...nowLines,
              [event.offset],
            ],
          ),
        );
      }
    });
    on<DrawingDrawModuleTutorialEvent>((event, emit) async {
      if (state is ModuleTutorialLoadedState) {
        final nowLine = (state as ModuleTutorialLoadedState).lines.last;
        final nowLines = (state as ModuleTutorialLoadedState).lines;
        final checkLine = nowLines.sublist(0, nowLines.length - 1);

        final newLine = [...nowLine, event.offset];
        final newLines = [...checkLine, newLine];
        emit((state as ModuleTutorialLoadedState).copyWith(lines: newLines));
      }
    });
    on<CompleteDrawModuleTutorialEvent>((event, emit) async {
      if (state is ModuleTutorialLoadedState) {
        final nowState = state as ModuleTutorialLoadedState;
        emit(ModuleTutorialLoadingState(step: nowState.step));
        final newFile = await saveDrawingAsImage(nowState.lines);
        final newWord = nowState.word;
        RegExp regex = RegExp(r'_(.+?)_');
        List<String> matches = regex
            .allMatches(newWord)
            .map((match) => match.group(1)!)
            .toList();

        final s3Url = iconS3Url[matches[0]]!;
        final url = iconsUrl[matches[0]]!;
        final check = await _postMissionPictureUsecase.execute(newFile, s3Url);

        if (check != null) {
          if (check.similarity >= 0.55) {
            emit(
              ModuleTutorialDrawSuccessState(
                step: state.step,
                url: url,
                lines: nowState.lines,
              ),
            );
            await _audioService.startAndWait(AssetSource('guides/29.wav'));
          } else {
            emit(
              ModuleTutorialDrawFailureState(
                step: state.step,
                url: url,
                lines: nowState.lines,
              ),
            );
            await _audioService.startAndWait(AssetSource('guides/30.wav'));
          }
        } else {
          emit(const ModuleTutorialFailureState(step: 5));
        }

        // } else {
        //   emit(
        //     ModuleTutorialDrawFailureState(
        //       step: state.step,
        //       word: (state as ModuleTutorialLoadedState).word,
        //       lines: (state as ModuleTutorialLoadedState).lines,
        //     ),
        //   );
        // }
      }
    });
    on<AudioPauseModuleTutorialEvent>((event, emit) async {
      _audioService.pause();
      if (state is ModuleTutorialLoadedState) {
        emit(
          (state as ModuleTutorialLoadedState).copyWith(isAudioStart: false),
        );
      }
    });
    on<AudioResumeModuleTutorialEvent>((event, emit) async {
      _audioService.resume();
      if (state is ModuleTutorialLoadedState) {
        emit((state as ModuleTutorialLoadedState).copyWith(isAudioStart: true));
      }
    });
  }

  Future<List<List<MapEntry<Duration, LyricEntry>>>> getSongParseMrVttList(
    List<SongParseMr> songParseMrList,
  ) async {
    List<List<MapEntry<Duration, LyricEntry>>> newList = [];
    for (int k = 1; k < 5; k++) {
      final lyrics = await _vttParse.loadLyrics(
        songParseMrList[k - 1].vttUrl,
        k,
      );
      newList.add(lyrics);
    }
    return newList;
  }

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

  Future<List<List<MapEntry<Duration, LyricEntry>>>> getSongParseVttList(
    List<SongParse> songParseList,
  ) async {
    List<List<MapEntry<Duration, LyricEntry>>> newList = [];
    for (int k = 1; k < 5; k++) {
      final lyrics = await _vttParse.loadLyrics(songParseList[k - 1].vttUrl, k);
      newList.add(lyrics);
    }
    return newList;
  }

  Future<List<List<MapEntry<Duration, LyricEntry>>>> getSongParseDrawVttList(
    List<SongParse> songParseList,
    Map<int, String> changeLyrics,
  ) async {
    List<List<MapEntry<Duration, LyricEntry>>> newList = [];
    for (int k = 1; k < 5; k++) {
      final lyrics = await _vttParse.loadLyrics(
        songParseList[k - 1].vttUrl,
        k,
        isChangeLyrics: true,
        isInitConsonant: false,
        changeLyrics: changeLyrics,
        isModuleTutorial: true,
      );
      newList.add(lyrics);
    }

    return newList;
  }

  final PostMissionPictureUsecase _postMissionPictureUsecase;
  final GetSongMrParseListUsecase _getSongMrParseListUsecase;
  final GetSongParseListUsecase _getSongParseListUsecase;
  final GetSongUseCase _getSongUseCase;
  final VttParse _vttParse;
  final AudioService _audioService;
}
