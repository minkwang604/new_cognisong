import 'package:new_cognisong/core/constants/constant.dart';
import 'package:new_cognisong/presentation/blocs/practice/practice_bloc.dart';
import 'package:new_cognisong/presentation/pages/common/mission_common_guide_view.dart';
import 'package:new_cognisong/presentation/pages/module_mission/module_mission_b_page.dart';
import 'package:new_cognisong/presentation/pages/preparation_mission/preparation_mission_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PracticeSeparateView extends StatelessWidget {
  PracticeSeparateView({super.key, this.onComplete});

  VoidCallback? onComplete;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PracticeBloc, PracticeState>(
      builder: (context, state) {
        if (state is PrePracticeState) {
          return const MissionCommonGuideView(
            color: orange,
            text: '학습 훈련을 연습해 볼까요?',
          );
        } else if (state is ModuleAPracticeState) {
          return PreParationMissionPage(
            widgetColor: orange,
            type: 'A',
            songId: 0,
            order: 0,
            songLevel: 6,
            isPractice: true,
            onComplete: () {
              context.read<PracticeBloc>().add(ModuleBPracticeEvent());
            },
          );
        } else if (state is ModuleBPracticeState) {
          return ModuleBMissionPage(
            color: orange,
            songId: 0,
            songLevel: 6,
            isPractice: true,
            order: 0,
            onComplete: onComplete,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
