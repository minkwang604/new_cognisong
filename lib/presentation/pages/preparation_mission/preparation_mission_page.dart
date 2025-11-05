import 'package:new_cognisong/core/injection_container.dart';
import 'package:new_cognisong/domain/usecases/mission/post_mission_audio_usecase.dart';
import 'package:new_cognisong/domain/usecases/mission/post_mission_submit_usecase.dart';
import 'package:new_cognisong/domain/usecases/song/get_song_mr_parse_list_usecase.dart';
import 'package:new_cognisong/domain/usecases/song/get_song_usecase.dart';
import 'package:new_cognisong/domain/usecases/user/user_get_song_level_info_usecase.dart';
import 'package:new_cognisong/presentation/blocs/preparation_mission/preparation_mission_bloc.dart';
import 'package:new_cognisong/presentation/pages/preparation_mission/preparation_mission_separate_view.dart';
import 'package:new_cognisong/presentation/pages/separate/separate_page.dart';
import 'package:new_cognisong/utils/audio_service.dart';
import 'package:new_cognisong/utils/record_service.dart';
import 'package:new_cognisong/utils/vtt_parse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreParationMissionPage extends StatelessWidget {
  PreParationMissionPage({
    super.key,
    required this.type,
    this.songId,
    this.songLevel,
    required this.order,
    this.widgetColor,
    this.onComplete,
    this.isPractice = false,
  });

  final String type;
  final int order;
  int? songId;
  int? songLevel;
  Color? widgetColor;
  VoidCallback? onComplete;
  final bool isPractice;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PreParationMissionBloc(
        audioService: AudioService(),
        recordService: RecordService(),
        vttParse: VttParse(),
        getSongMrParseListUsecase: getIt<GetSongMrParseListUsecase>(),
        postMissionAudioUsecase: getIt<PostMissionAudioUsecase>(),
        postMissionSubmitUsecase: getIt<PostMissionSubmitUsecase>(),
        userGetSongLevelInfoUseCase: getIt<UserGetSongLevelInfoUseCase>(),
        getSongUseCase: getIt<GetSongUseCase>(),
        type: type,
        order: order,
        isPractice: isPractice,
      )..add(InitPreParationMissionEvent(songId: songId, songLevel: songLevel)),
      child: BlocConsumer<PreParationMissionBloc, PreParationMissionState>(
        listener: (context, state) {
          if (state is PreParationMissionFinalCompleteState) {
            if (onComplete != null) {
              onComplete!();
            } else {
              if (order != 5) {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const SeparatePage(isFirst: false),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              }
            }
          }
        },
        builder: (context, state) {
          return WillPopScope(
            child: PreParationMissionSeparateView(
              order: order,
              color: widgetColor ?? Theme.of(context).primaryColor,
            ),
            onWillPop: () async {
              context.read<PreParationMissionBloc>().add(
                AudioStopPreParationMissionEvent(),
              );
              return true;
            },
          );
        },
      ),
    );
  }
}
