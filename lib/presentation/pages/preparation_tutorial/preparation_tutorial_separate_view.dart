import 'package:new_cognisong/core/constants/constant.dart';
import 'package:new_cognisong/presentation/blocs/preparation_tutorial/preparation_tutorial_bloc.dart';
import 'package:new_cognisong/presentation/pages/common/mission_common_guide_view.dart';
import 'package:new_cognisong/presentation/pages/common/mission_common_success_view.dart';
import 'package:new_cognisong/presentation/pages/preparation_tutorial/view/prerparation_tutorial_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreParationTutorialSeparateView extends StatefulWidget {
  const PreParationTutorialSeparateView({super.key});

  @override
  State<PreParationTutorialSeparateView> createState() =>
      _PreParationTutorialSeparateViewState();
}

class _PreParationTutorialSeparateViewState
    extends State<PreParationTutorialSeparateView>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        context.read<PreParationTutorialBloc>().add(
          AudioResumePreParationTutorialEvent(),
        );
        break;
      case AppLifecycleState.paused:
        context.read<PreParationTutorialBloc>().add(
          AudioPausePreParationTutorialEvent(),
        );
        break;

      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreParationTutorialBloc, PreParationTutorialState>(
      builder: (context, state) {
        if (state is PreParationTutorialInitState) {
          switch (state.step) {
            case 1:
              return const MissionCommonGuideView(
                text: '함께 노래를 들어봐요!',
                color: lightCoralPink,
              );
            case 2:
              return const MissionCommonGuideView(
                text: '이제 한 소절씩 노래를\n따라 불러봐요!',
                color: lightCoralPink,
              );
            case 3:
              return const MissionCommonGuideView(
                text: '이제 반주에 맞춰서\n노래를 불러볼까요?',
                color: lightCoralPink,
              );
            default:
              return Container();
          }
        } else if (state is PreParationTutorialPreInitState) {
          return const MissionCommonGuideView(
            text: '지금부터 준비과정을 시작해 볼까요?',
            color: lightCoralPink,
          );
        } else if (state is PreParationTutorialLoadedState) {
          return const PreParationTutorialView(primaryColor: lightCoralPink);
        } else if (state is PreParationTutorialSuccessState) {
          return switch (state.step) {
            1 => const MissionCommonSuccessView(
              appBarTitle: '노래 청취 완료!',
              color: lightCoralPink,
              text: '잘 들으셨나요?\n다음도 함께 해봐요!',
            ),
            2 => const MissionCommonSuccessView(
              color: lightCoralPink,
              appBarTitle: '소절별 부르기 완료!',
              text: '고생하셨어요.\n다음으로 넘어가 볼게요!',
            ),
            3 => const MissionCommonSuccessView(
              appBarTitle: '반주맞춰서 부르기 완료!',
              color: lightCoralPink,
              text: '잘 하셨어요!\n계속 해 볼까요?',
            ),
            _ => Container(),
          };
        } else {
          return Container();
        }
      },
    );
  }
}
