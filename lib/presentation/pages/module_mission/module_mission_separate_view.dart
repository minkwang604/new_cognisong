import 'package:new_cognisong/presentation/blocs/module_mission/module_mission_bloc.dart';
import 'package:new_cognisong/presentation/pages/common/mission_common_guide_view.dart';
import 'package:new_cognisong/presentation/pages/common/mission_common_success_view.dart';
import 'package:new_cognisong/presentation/pages/common/mission_success_or_failure_view.dart';
import 'package:new_cognisong/presentation/pages/module_mission/view/module_mission_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModuleMissionSeparateView extends StatefulWidget {
  const ModuleMissionSeparateView({
    super.key,
    required this.order,
    required this.color,
  });

  final int order;
  final Color color;
  @override
  State<ModuleMissionSeparateView> createState() =>
      _ModuleMissionSeparateViewState();
}

class _ModuleMissionSeparateViewState extends State<ModuleMissionSeparateView>
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
        context.read<ModuleMissionBloc>().add(AudioResumeModuleMissionEvent());
        break;
      case AppLifecycleState.paused:
        context.read<ModuleMissionBloc>().add(AudioPauseModuleMissionEvent());
        break;

      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModuleMissionBloc, ModuleMissionState>(
      builder: (context, state) {
        if (state is ModuleMissionInitState) {
          return MissionCommonGuideView(
            text: '빈칸 속 단어에 맞춰\n그림을 그려봐요!',
            color: widget.color,
          );
        } else if (state is ModuleMissionLoadedState) {
          return ModuleMissionView(order: widget.order, color: widget.color);
        } else if (state is ModuleMissionDrawSuccessState) {
          return MissionSuccessOrFailure(
            color: widget.color,
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
          );
        } else if (state is ModuleMissionDrawFailureState) {
          return MissionSuccessOrFailure(
            color: widget.color,
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
        } else if (state is ModuleMissionSuccessState) {
          return MissionCommonSuccessView(
            appBarTitle: '미션 완료!',
            text: state.info,
            isAdmin: state.isAdmin,
            color: widget.color,
          );
        }
        return Container(color: Colors.white);
      },
    );
  }
}
