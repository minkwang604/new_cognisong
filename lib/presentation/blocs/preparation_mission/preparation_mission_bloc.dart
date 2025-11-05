import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:new_cognisong/domain/entities/mission_submit.dart';
import 'package:new_cognisong/domain/entities/module.dart';
import 'package:new_cognisong/domain/entities/song.dart';
import 'package:new_cognisong/domain/usecases/mission/post_mission_audio_usecase.dart';
import 'package:new_cognisong/domain/usecases/mission/post_mission_submit_usecase.dart';
import 'package:new_cognisong/domain/usecases/song/get_song_mr_parse_list_usecase.dart';
import 'package:new_cognisong/domain/usecases/song/get_song_usecase.dart';
import 'package:new_cognisong/domain/usecases/user/user_get_song_level_info_usecase.dart';
import 'package:new_cognisong/utils/audio_service.dart';
import 'package:new_cognisong/utils/record_service.dart';
import 'package:new_cognisong/utils/vtt_parse.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'preparation_mission_event.dart';
part 'preparation_mission_state.dart';

class PreParationMissionBloc
    extends Bloc<PreParationMissionEvent, PreParationMissionState> {
  PreParationMissionBloc({
    required AudioService audioService,
    required String type,
    required RecordService recordService,
    required VttParse vttParse,
    required GetSongMrParseListUsecase getSongMrParseListUsecase,
    required PostMissionAudioUsecase postMissionAudioUsecase,
    required PostMissionSubmitUsecase postMissionSubmitUsecase,
    required UserGetSongLevelInfoUseCase userGetSongLevelInfoUseCase,
    required GetSongUseCase getSongUseCase,
    required int order,
    required bool isPractice,
  }) : _audioService = audioService,
       _recordService = recordService,
       _type = type,
       _vttParse = vttParse,
       _getSongMrParseListUsecase = getSongMrParseListUsecase,
       _postMissionAudioUsecase = postMissionAudioUsecase,
       _postMissionSubmitUsecase = postMissionSubmitUsecase,
       _userGetSongLevelInfoUseCase = userGetSongLevelInfoUseCase,
       _getSongUseCase = getSongUseCase,
       _order = order,
       _isPractice = isPractice,
       super(PreParationMissionInitState()) {
    on<InitPreParationMissionEvent>((event, emit) async {
      await _audioService.startAndWait(AssetSource('guides/14.wav'));

      add(
        LoadPreParationMissionEvent(
          songId: event.songId,
          songLevel: event.songLevel,
        ),
      );
      // emit(PreParationMissionFinalCompleteState());
    });
    on<LoadPreParationMissionEvent>((event, emit) async {
      emit(PreParationMissionLoadedState());

      final songParseMrList = event.songId == null
          ? await _getSongMrParseListUsecase.execute()
          : await _getSongMrParseListUsecase.execute(songId: event.songId);

      final song = event.songId == null
          ? await _getSongUseCase.execute()
          : await _getSongUseCase.execute(songId: event.songId);

      final changeLyrics = event.songLevel == null
          ? await _vttParse.changeLyrics(Module.A)
          : await _vttParse.changeLyrics(
              Module.A,
              songId: event.songId,
              songLevel: event.songLevel,
            );

      if (songParseMrList == null || song == null) {
        emit(PreParationMissionFailureState());
      } else {
        final songId = song.id;
        final songLevelInfo = event.songLevel == null
            ? await _userGetSongLevelInfoUseCase.execute(Module.A)
            : await _userGetSongLevelInfoUseCase.execute(
                Module.A,
                songLevel: event.songLevel,
              );

        final isInitConsonant = songLevelInfo == null
            ? false
            : songLevelInfo.isInitConsonant;

        for (int k = 0; k < 4; k++) {
          final nowState = state as PreParationMissionLoadedState;

          final songParseMr = songParseMrList.songParseMrList[k];
          final vttUrl = await _vttParse.loadLyrics(
            songParseMr.vttUrl,
            k,
            isChangeLyrics: true,
            changeLyrics: changeLyrics,
            isInitConsonant: isInitConsonant,
          );
          final lyricState = nowState.copyWith(lyricEntries: vttUrl);

          emit(lyricState.copyWith(title: '준비되셨나요?'));
          await _audioService.startAndWait(AssetSource('guides/09.wav'));
          for (int i = 3; i > -1; i--) {
            emit(lyricState.copyWith(countDownValue: i, title: '준비되셨나요?'));
            await Future.delayed(const Duration(seconds: 1));
          }
          await _audioService.start(UrlSource(songParseMr.mrUrl));
          _audioService.positionChangeEvent((event) async {
            add(PositionChangePreParationMissionEvent(position: event));
          });

          //노래모음
          k == 0 ? await _recordService.start() : await _recordService.resume();

          final fileLength = await _audioService.getDuration();
          emit(
            lyricState.copyWith(
              title: '시작! 빈칸을 채워 불러보세요!',
              totalPosition: fileLength,
              isAudioStart: true,
            ),
          );

          await _audioService.wait();
          await _recordService.pause();
          _audioService.stopChangEvent();

          emit(nowState);
          // emit(PreParationMissionFinalCompleteState());
        }

        final isAdmin =
            _isPractice == false &&
                event.songId != null &&
                event.songLevel != null
            ? true
            : false;

        //저장
        String? path = await _recordService.stop();
        var file = File(path!);
        emit(PreParationMissionLoadingState());
        final missionTranscription = await _postMissionAudioUsecase.execute(
          file,
        );
        if (missionTranscription == null) {
          emit(PreParationMissionFailureState());
        } else {
          final response = await _postMissionSubmitUsecase.execute(
            MissionSubmit(
              order: _order,
              createdAt: startTime,
              type: _type,
              missionWord: Map.fromEntries(
                changeLyrics.entries.map(
                  (entry) => MapEntry(entry.key.toString(), entry.value),
                ),
              ),
              song: _isPractice ? -1 : songId,
              audioText: missionTranscription.audioText.replaceAll(" ", ''),
              isTest: _isPractice
                  ? false
                  : event.songId == null
                  ? false
                  : true,
            ),
          );

          if (response == null) {
            emit(PreParationMissionFailureState());
          } else {
            add(
              ResultPreParationMissionEvent(
                changeLyrics: changeLyrics,
                song: song,
                score: response.score,
                isAdmin: isAdmin,
              ),
            );
          }
          // } else {
          //   add(ResultPreParationMissionEvent(
          //     changeLyrics: changeLyrics,
          //     song: song,
          //     score: 1.00,
          //     isAdmin: isAdmin,
          //   ));
          // }
        }
      }
    });
    on<PositionChangePreParationMissionEvent>((event, emit) async {
      if (state is PreParationMissionLoadedState) {
        final nowState = state as PreParationMissionLoadedState;
        emit(
          nowState.copyWith(
            currentPosition: event.position,
            lyricPositionIndex: _vttParse.getLyricsIndexAtPosition(
              event.position,
              nowState.lyricEntries,
            ),
          ),
        );
      } else if (state is PreParationMissionResultState) {
        final nowState = state as PreParationMissionResultState;
        emit(
          nowState.copyWith(
            currentPosition: event.position,
            lyricPositionIndex: _vttParse.getLyricsIndexAtPosition(
              event.position,
              nowState.lyricEntries,
            ),
            lyricsLines: _vttParse.getLyricsLineAtPosition(event.position) <= 2
                ? [1, 2]
                : [3, 4],
          ),
        );
      }
    });
    on<AudioAndRecordChangeStatePreParationMissionEvent>((event, emit) async {
      if (state is PreParationMissionLoadedState) {
        final nowState = state as PreParationMissionLoadedState;
        if (nowState.isAudioStart) {
          _audioService.pause();
          await _recordService.pause();
          emit(nowState.copyWith(isAudioStart: false));
        } else {
          _audioService.resume();
          await _recordService.resume();
          emit(nowState.copyWith(isAudioStart: true));
        }
      }
    });
    on<ResultPreParationMissionEvent>((event, emit) async {
      emit(PreParationMissionResultInitState());
      await _audioService.startAndWait(AssetSource('guides/15.wav'), second: 3);
      emit(PreParationMissionResultState(changeLyrics: event.changeLyrics));

      if (event.song == null) {
        emit(PreParationMissionFailureState());
      } else {
        final nowState = state as PreParationMissionResultState;
        final lyric = await _vttParse.loadLyrics(
          event.song!.vttUrl,
          null,
          isChangeLyrics: true,
          isInitConsonant: false,
          changeLyrics: nowState.changeLyrics,
          isModuleTutorial: true,
        );

        final lyricState = nowState.copyWith(lyricEntries: lyric);

        emit(lyricState);

        await _audioService.start(UrlSource(event.song!.url));
        _audioService.positionChangeEvent((event) async {
          add(PositionChangePreParationMissionEvent(position: event));
        });
        final fileLength = await _audioService.getDuration();
        emit(lyricState.copyWith(totalPosition: fileLength));
        await _audioService.wait();
        _audioService.stopChangEvent();

        final num = (() {
          if (event.score >= 0.95) {
            return 1;
          } else if (event.score >= 0.85) {
            return 2;
          } else if (event.score >= 0.75) {
            return 3;
          } else if (event.score >= 0.5) {
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
        //   5 => '아쉽네요, 이전 단계부터 차근차근 해 보아요.',
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

        emit(
          PreParationMissionCompleteState(
            score: event.score,
            info: info,
            isAdmin: event.isAdmin,
          ),
        );
        await _audioService.startAndWait(AssetSource(infoUrl), second: 1);

        event.isAdmin ? null : emit(PreParationMissionFinalCompleteState());
      }
    });
    on<AudioPausePreParationMissionEvent>((event, emit) async {
      _audioService.pause();
      await _recordService.pause();
    });
    on<AudioResumePreParationMissionEvent>((event, emit) async {
      _audioService.resume();
      await _recordService.resume();
    });
    on<AudioStopPreParationMissionEvent>((event, emit) async {
      _audioService.stop();
      await _recordService.stop();
    });
  }

  final startTime = DateTime.now();
  final AudioService _audioService;
  final RecordService _recordService;
  final VttParse _vttParse;
  final GetSongMrParseListUsecase _getSongMrParseListUsecase;
  final PostMissionAudioUsecase _postMissionAudioUsecase;
  final UserGetSongLevelInfoUseCase _userGetSongLevelInfoUseCase;
  final GetSongUseCase _getSongUseCase;
  final PostMissionSubmitUsecase _postMissionSubmitUsecase;
  final String _type;
  final int _order;
  final bool _isPractice;
}
