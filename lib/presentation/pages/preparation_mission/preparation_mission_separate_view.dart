import 'package:new_cognisong/presentation/blocs/preparation_mission/preparation_mission_bloc.dart';
import 'package:new_cognisong/presentation/pages/common/loading.dart';
import 'package:new_cognisong/presentation/pages/common/mission_common_guide_view.dart';
import 'package:new_cognisong/presentation/pages/common/mission_common_success_view.dart';
import 'package:new_cognisong/presentation/pages/preparation_mission/view/preparation_mission_result_view.dart';
import 'package:new_cognisong/presentation/pages/preparation_mission/view/preparation_mission_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreParationMissionSeparateView extends StatefulWidget {
  const PreParationMissionSeparateView({
    super.key,
    required this.order,
    required this.color,
  });

  final int order;
  final Color color;
  @override
  State<PreParationMissionSeparateView> createState() =>
      _PreParationMissionSeparateViewState();
}

class _PreParationMissionSeparateViewState
    extends State<PreParationMissionSeparateView>
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
        context.read<PreParationMissionBloc>().add(
          AudioResumePreParationMissionEvent(),
        );
        break;
      case AppLifecycleState.paused:
        context.read<PreParationMissionBloc>().add(
          AudioPausePreParationMissionEvent(),
        );
        break;

      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreParationMissionBloc, PreParationMissionState>(
      builder: (context, state) {
        if (state is PreParationMissionLoadedState) {
          return PreParationMissionView(
            order: widget.order,
            color: widget.color,
          );
        } else if (state is PreParationMissionInitState) {
          return MissionCommonGuideView(
            color: widget.color,
            text: '이번에는 빈칸에 가사를 채워\n노래를 불러볼까요?',
          );
        } else if (state is PreParationMissionResultState) {
          return PreParationMissionResultView(color: widget.color);
        } else if (state is PreParationMissionLoadingState) {
          return const Loading();
        } else if (state is PreParationMissionResultInitState) {
          return MissionCommonGuideView(
            color: widget.color,
            text: '정답을 확인해볼까요!',
          );
        } else if (state is PreParationMissionCompleteState) {
          return MissionCommonSuccessView(
            appBarTitle: '미션 완료!',
            text: state.info,
            isAdmin: state.isAdmin,
            color: widget.color,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
