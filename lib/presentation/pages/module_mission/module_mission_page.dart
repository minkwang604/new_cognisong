import 'package:new_cognisong/presentation/blocs/mission_cubit.dart';
import 'package:new_cognisong/presentation/pages/common/mission_common_guide_view.dart';
import 'package:new_cognisong/presentation/pages/module_mission/module_mission_b_page.dart';
import 'package:new_cognisong/presentation/pages/preparation_mission/preparation_mission_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModuleMissionPage extends StatelessWidget {
  ModuleMissionPage({
    super.key,
    required this.module,
    required this.order,
    this.songId,
    this.songLevel,
    this.color,
    this.onComplete,
  });

  final String module;
  final int order;
  int? songLevel;
  int? songId;
  final Color? color;
  VoidCallback? onComplete;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MissionCubit()..start(order),
      child: BlocBuilder<MissionCubit, MissionState>(
        builder: (context, state) {
          if (order == 1 && state.checking) {
            return MissionCommonGuideView(
              color: color,
              text:
                  '이제부터 단어 기반 학습 훈련과\n 그림 기반 학습 훈련이 자동으로 나옵니다.\n학습 훈련을 시작해 볼까요?',
            );
          }

          return module == 'B'
              ? ModuleBMissionPage(
                  color: color ?? Theme.of(context).primaryColor,
                  songId: songId,
                  songLevel: songLevel,
                  order: order,
                  onComplete: onComplete,
                )
              : PreParationMissionPage(
                  type: 'A',
                  order: order,
                  songId: songId,
                  songLevel: songLevel,
                );
        },
      ),
    );
  }
}
