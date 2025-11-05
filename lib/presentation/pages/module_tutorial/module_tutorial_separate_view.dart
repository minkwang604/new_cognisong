import 'package:new_cognisong/presentation/blocs/module_tutorial/module_tutorial_bloc.dart';
import 'package:new_cognisong/presentation/pages/common/mission_common_guide_view.dart';
import 'package:new_cognisong/presentation/pages/common/mission_common_success_view.dart';
import 'package:new_cognisong/presentation/pages/common/mission_success_or_failure_view.dart';
import 'package:new_cognisong/presentation/pages/module_tutorial/view/module_tutorial_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModuleTutorialSeparateView extends StatefulWidget {
  const ModuleTutorialSeparateView({super.key});

  @override
  State<ModuleTutorialSeparateView> createState() =>
      _ModuleTutorialSeparateViewState();
}

class _ModuleTutorialSeparateViewState extends State<ModuleTutorialSeparateView>
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
        context.read<ModuleTutorialBloc>().add(
          AudioResumeModuleTutorialEvent(),
        );
        break;
      case AppLifecycleState.paused:
        context.read<ModuleTutorialBloc>().add(AudioPauseModuleTutorialEvent());
        break;

      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModuleTutorialBloc, ModuleTutorialState>(
      builder: (context, state) {
        if (state is ModuleTutorialInitState) {
          return switch (state.step) {
            1 => const MissionCommonGuideView(text: '함께 노래를 들어봐요!'),
            2 => const MissionCommonGuideView(text: '한 소절씩 노래를\n따라 불러봐요!'),
            3 => const MissionCommonGuideView(text: '이제 반주에 맞춰서\n노래를 불러볼까요?'),
            // 4 => const MissionCommonGuideView(text: '가사 속 단어에 맞춰\n그림을 그려봐요!'),
            _ => Container(),
          };
        } else if (state is ModuleTutorialPreInitState) {
          return const MissionCommonGuideView(
            text: '지금부터 노래 가사가 바뀌어요!\n새로운 가사를 배워볼까요?',
          );
        } else if (state is ModuleTutorialLoadedState) {
          return const ModuleTutorialView();
          // return state.step < 4
          //     ? const ModuleTutorialView()
          //     : const ModuleTutorialDrawView();
        } else if (state is ModuleTutorialSuccessState) {
          return switch (state.step) {
            1 => const MissionCommonSuccessView(
              appBarTitle: '노래 청취 완료!',
              text: '잘 들으셨나요?\n다음도 함께 해봐요!',
            ),
            2 => const MissionCommonSuccessView(
              appBarTitle: '소절별 부르기 완료!',
              text: '고생하셨어요.\n다음으로 넘어가 볼게요!',
            ),
            3 => const MissionCommonSuccessView(
              appBarTitle: '반주맞춰서 부르기 완료!',
              text: '얼마 안 남았어요.\n 같이 화이팅해요',
            ),
            // 4 => const MissionCommonSuccessView(
            //     appBarTitle: '모든 그림 그리기 완료!', text: '잘 하셨어요!\n계속 해 볼까요?'),
            _ => Container(color: Colors.white),
          };
        } else if (state is ModuleTutorialDrawSuccessState) {
          return MissionSuccessOrFailure(
            appBarWidget: const Center(
              child: Text(
                '정말 잘 그리셨네요!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            lines: state.lines,
            url: state.url,
            color: Theme.of(context).primaryColor,
          );
        } else if (state is ModuleTutorialDrawFailureState) {
          return MissionSuccessOrFailure(
            color: Theme.of(context).primaryColor,
            appBarWidget: const Center(
              child: Text(
                '그림을 다시 한 번 확인해보세요!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            lines: state.lines,
            url: state.url,
          );
        } else {
          return Container(color: Colors.white);
        }
      },
    );
  }
}
