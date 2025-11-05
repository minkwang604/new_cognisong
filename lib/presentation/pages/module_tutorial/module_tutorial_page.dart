import 'package:new_cognisong/core/injection_container.dart';
import 'package:new_cognisong/domain/usecases/mission/post_mission_picture_usecase.dart';
import 'package:new_cognisong/domain/usecases/song/get_song_mr_parse_list_usecase.dart';
import 'package:new_cognisong/domain/usecases/song/get_song_parse_list_usecase.dart';
import 'package:new_cognisong/domain/usecases/song/get_song_usecase.dart';
import 'package:new_cognisong/presentation/blocs/module_tutorial/module_tutorial_bloc.dart';
import 'package:new_cognisong/presentation/pages/common/loadingDialog.dart';
import 'package:new_cognisong/presentation/pages/module_tutorial/module_tutorial_separate_view.dart';
import 'package:new_cognisong/presentation/pages/separate/separate_page.dart';
import 'package:new_cognisong/utils/audio_service.dart';
import 'package:new_cognisong/utils/vtt_parse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModuleTutorialPage extends StatelessWidget {
  const ModuleTutorialPage({super.key, this.onComplete});

  final VoidCallback? onComplete;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ModuleTutorialBloc(
        postMissionPictureUsecase: getIt<PostMissionPictureUsecase>(),
        initState: const ModuleTutorialInitState(step: 0),
        audioService: AudioService(),
        vttParse: VttParse(),
        getSongUseCase: getIt<GetSongUseCase>(),
        getSongMrParseListUsecase: getIt<GetSongMrParseListUsecase>(),
        getSongParseListUsecase: getIt<GetSongParseListUsecase>(),
      )..add(PreInitModuleTutorialEvent()),
      child: BlocConsumer<ModuleTutorialBloc, ModuleTutorialState>(
        builder: (context, state) {
          return const ModuleTutorialSeparateView();
        },
        listener: (context, state) async {
          if (state is ModuleTutorialAllSuccessState) {
            // Navigator.pop(context);
            if (onComplete != null) {
              onComplete!();
            } else {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const SeparatePage(isFirst: false, isFromTutorial: true),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
            }
          } else if (state is ModuleTutorialLoadingState) {
            dialog(context);
          } else if (state is ModuleTutorialDrawFailureState ||
              state is ModuleTutorialDrawSuccessState) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
