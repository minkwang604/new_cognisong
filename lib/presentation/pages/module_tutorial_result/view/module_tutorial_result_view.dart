import 'package:new_cognisong/presentation/blocs/module_tutorial_result/module_tutorial_result_bloc.dart';
import 'package:new_cognisong/presentation/pages/common/mission_success_or_failure_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModuleTutorialResultView extends StatelessWidget {
  ModuleTutorialResultView({super.key, this.color});

  Color? color;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModuleTutorialResultBloc, ModuleTutorialResultState>(
      builder: (context, state) {
        final nowState = state as ModuleTutorialResultLoadedState;
        return MissionSuccessOrFailure(
          color: color ?? Theme.of(context).primaryColor,
          appBarWidget: Center(
            child: Text(
              nowState.isSuccess ? '정말 잘 그리셨네요!' : '그림을 다시 한 번 확인해보세요!',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          lines: nowState.offset,
          url: state.url,
        );
      },
    );
  }
}
