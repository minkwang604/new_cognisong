import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:new_cognisong/domain/entities/song.dart';
import 'package:new_cognisong/domain/entities/song_parse.dart';
import 'package:new_cognisong/domain/entities/song_parse_mr.dart';
import 'package:new_cognisong/domain/usecases/song/get_song_mr_parse_list_usecase.dart';
import 'package:new_cognisong/domain/usecases/song/get_song_parse_list_usecase.dart';
import 'package:new_cognisong/domain/usecases/song/get_song_usecase.dart';
import 'package:new_cognisong/utils/audio_service.dart';
import 'package:new_cognisong/utils/vtt_parse.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'preparation_tutorial_event.dart';
part 'preparation_tutorial_state.dart';

class PreParationTutorialBloc
    extends Bloc<PreParationTutorialEvent, PreParationTutorialState> {
  PreParationTutorialBloc({
    required AudioService audioService,
    required VttParse vttParse,
    required GetSongUseCase getSongUseCase,
    required GetSongMrParseListUsecase getSongMrParseListUsecase,
    required GetSongParseListUsecase getSongParseListUsecase,
  }) : _audioService = audioService,
       _vttParse = vttParse,
       _getSongUseCase = getSongUseCase,
       _getSongParseListUsecase = getSongParseListUsecase,
       _getSongMrParseListUsecase = getSongMrParseListUsecase,
       super(const PreParationTutorialInitState(step: 0)) {
    //여기가 새로 추가된 부분
    on<PreInitPreParationTutorialEvent>((event, emit) async {
      emit(const PreParationTutorialPreInitState());
      // emit(const PreParationTutorialSuccessState(step: 1));
      // emit(const PreParationTutorialAllSuccessState(step: 0));
      //여기 노래 변경하기
      await _audioService.startAndWait(
        AssetSource('guides/new_1.mp3'),
        second: 2,
      );
      add(InitPreParationTutorialEvent(step: 1));
    });
    on<InitPreParationTutorialEvent>((event, emit) async {
      emit(PreParationTutorialInitState(step: event.step));
      String guide = switch (event.step) {
        1 => 'guides/03.wav',
        2 => 'guides/06.wav',
        3 => 'guides/11.wav',
        _ => '',
      };
      if (guide != '') {
        await _audioService.startAndWait(AssetSource(guide), second: 3);
      }

      add(LoadedPreParationTutorialEvent(step: event.step));
    });
    on<LoadedPreParationTutorialEvent>((event, emit) async {
      emit(PreParationTutorialLoadedState(step: event.step));

      final song = await switch (event.step) {
        1 => _getSongUseCase.execute(),
        2 => _getSongParseListUsecase.execute(),
        3 => _getSongUseCase.execute(),
        _ => null,
      };

      if (song == null) {
        emit(PreParationTutorialFailureState(step: event.step));
      } else {
        List<List<MapEntry<Duration, LyricEntry>>> lyricsList = switch (event
            .step) {
          1 => [await _vttParse.loadLyrics((song as Song).vttUrl, null)],
          2 => await getSongParseVttList((song as SongParseList).songParseList),
          3 => [await _vttParse.loadLyrics((song as Song).vttUrl, null)],
          _ => [],
        };
        final newSong = await _getSongMrParseListUsecase.execute();

        for (int k = 0; k < lyricsList.length; k++) {
          final lyrics = lyricsList[k];
          final nowState = state as PreParationTutorialLoadedState;
          final title = switch (event.step) {
            1 => '편하게 노래를 들어보세요',
            2 => '노래를 들어보세요.',
            3 => '반주에 맞춰서 노래를 불러보세요!',
            _ => '',
          };

          final LyricState = nowState.copyWith(
            title: title,
            lyricEntries: lyrics,
            lyricsLine: event.step == 1 || event.step == 3 ? null : k,
          );

          final songUrl = switch (event.step) {
            1 => (song as Song).url,
            2 => ((song as SongParseList).songParseList[k]).url,
            3 => (song as Song).mrUrl,
            _ => null,
          };

          final middleGuideUrl = switch (event.step) {
            1 => 'guides/04.wav',
            2 => 'guides/07.wav',
            3 => 'guides/11.wav',
            _ => null,
          };

          emit(LyricState);
          // 가이드 부터 노래 나오는 부분
          await _audioService.startAndWait(AssetSource(middleGuideUrl!));

          await _audioService.start(UrlSource(songUrl!));
          _audioService.positionChangeEvent((event) async {
            add(PositionChangePreParationTutorialEvent(position: event));
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
              title: '이제 노래를 불러볼까요?',
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
            await _audioService.start(UrlSource(speakSong));
            _audioService.positionChangeEvent((event) async {
              add(PositionChangePreParationTutorialEvent(position: event));
            });
            await _audioService.wait();
            _audioService.stopChangEvent();
            // await Future.doWhile(() async {
            //   elapsedTime += const Duration(milliseconds: 100);
            //   add(PositionChangePreParationTutorialEvent(
            //       position: elapsedTime));
            //   await Future.delayed(const Duration(milliseconds: 100));
            //   return elapsedTime <= fileLength!;
            // });
          }

          emit(nowState);
        }
      }

      final lastGuideUrl = switch (event.step) {
        1 => 'guides/new_5.wav',
        2 => 'guides/new_10.wav',
        3 => 'guides/new_13.wav',
        _ => null,
      };

      if (event.step < 3) {
        emit(PreParationTutorialSuccessState(step: event.step));
        await _audioService.startAndWait(AssetSource(lastGuideUrl!), second: 2);
        add(InitPreParationTutorialEvent(step: event.step + 1));
      } else {
        emit(PreParationTutorialSuccessState(step: event.step));
        await _audioService.startAndWait(AssetSource(lastGuideUrl!), second: 2);
        emit(const PreParationTutorialAllSuccessState(step: 0));
      }
    });
    on<PositionChangePreParationTutorialEvent>((event, emit) async {
      if (state is PreParationTutorialLoadedState) {
        final nowState = state as PreParationTutorialLoadedState;
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
    on<PauseAndResumeClickPreParationTutorialEvent>((event, emit) async {
      if (state is PreParationTutorialLoadedState) {
        if (await _audioService.isPlaying()) {
          _audioService.pause();
          emit(
            (state as PreParationTutorialLoadedState).copyWith(
              isAudioStart: false,
            ),
          );
        } else {
          _audioService.resume();
          emit(
            (state as PreParationTutorialLoadedState).copyWith(
              isAudioStart: true,
            ),
          );
        }
      }
    });
    on<AudioResumePreParationTutorialEvent>((event, emit) async {
      _audioService.resume();
      if (state is PreParationTutorialLoadedState) {
        emit(
          (state as PreParationTutorialLoadedState).copyWith(
            isAudioStart: true,
          ),
        );
      }
    });
    on<AudioPausePreParationTutorialEvent>((event, emit) async {
      _audioService.pause();
      if (state is PreParationTutorialLoadedState) {
        emit(
          (state as PreParationTutorialLoadedState).copyWith(
            isAudioStart: false,
          ),
        );
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

  final GetSongParseListUsecase _getSongParseListUsecase;
  final GetSongMrParseListUsecase _getSongMrParseListUsecase;
  final GetSongUseCase _getSongUseCase;
  final VttParse _vttParse;
  final AudioService _audioService;
}
