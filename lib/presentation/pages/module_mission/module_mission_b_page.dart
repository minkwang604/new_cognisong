import 'package:new_cognisong/core/injection_container.dart';
import 'package:new_cognisong/domain/usecases/mission/post_mission_picture_usecase.dart';
import 'package:new_cognisong/domain/usecases/mission/post_mission_submit_usecase.dart';
import 'package:new_cognisong/domain/usecases/song/get_song_mr_parse_list_usecase.dart';
import 'package:new_cognisong/domain/usecases/song/get_song_parse_list_usecase.dart';
import 'package:new_cognisong/domain/usecases/user/user_get_song_level_info_usecase.dart';
import 'package:new_cognisong/domain/usecases/user/user_update_user_stat_usecase.dart';
import 'package:new_cognisong/presentation/blocs/module_mission/module_mission_bloc.dart';
import 'package:new_cognisong/presentation/pages/common/loadingDialog.dart';
import 'package:new_cognisong/presentation/pages/module_mission/module_mission_separate_view.dart';
import 'package:new_cognisong/presentation/pages/separate/separate_page.dart';
import 'package:new_cognisong/utils/audio_service.dart';
import 'package:new_cognisong/utils/vtt_parse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModuleBMissionPage extends StatelessWidget {
  ModuleBMissionPage({
    super.key,
    this.songId,
    this.songLevel,
    required this.order,
    required this.color,
    this.onComplete,
    this.isPractice = false,
  });

  final int order;
  int? songId;
  int? songLevel;
  final Color color;
  VoidCallback? onComplete;
  final bool isPractice;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ModuleMissionBloc(
        updateUserStatUsecase: getIt<UserUpdateUserStatUsecase>(),
        isPractice: isPractice,
        order: order,
        postMissionPictureUsecase: getIt<PostMissionPictureUsecase>(),
        audioService: AudioService(),
        getSongParseListUsecase: getIt<GetSongParseListUsecase>(),
        userGetSongLevelInfoUseCase: getIt<UserGetSongLevelInfoUseCase>(),
        vttParse: VttParse(),
        postMissionSubmitUsecase: getIt<PostMissionSubmitUsecase>(),
        getSongMrParseListUsecase: getIt<GetSongMrParseListUsecase>(),
      )..add(InitModuleMissionEvent(songId: songId, songLevel: songLevel)),
      child: BlocConsumer<ModuleMissionBloc, ModuleMissionState>(
        listener: (context, state) {
          if (state is ModuleMissionAllSuccessState) {
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
          } else if (state is ModuleMissionLoadingState) {
            dialog(context);
          } else if (state is ModuleMissionDrawFailureState ||
              state is ModuleMissionDrawSuccessState ||
              state is ModuleMissionSuccessState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return WillPopScope(
            child: ModuleMissionSeparateView(order: order, color: color),
            onWillPop: () async {
              context.read<ModuleMissionBloc>().add(
                AudioStopModuleMissionEvent(),
              );
              return true;
            },
          );
        },
      ),
    );
  }
}
