import 'package:new_cognisong/core/constants/constant.dart';
import 'package:new_cognisong/core/injection_container.dart';
import 'package:new_cognisong/domain/usecases/mission/get_mission_usecase.dart';
import 'package:new_cognisong/domain/usecases/user/user_get_user_stat_usecase.dart';
import 'package:new_cognisong/domain/usecases/user/user_get_user_usecase.dart';
import 'package:new_cognisong/domain/usecases/user/user_logout_usecase.dart';
import 'package:new_cognisong/domain/usecases/user/user_song_first_completed_usecase.dart';
import 'package:new_cognisong/presentation/blocs/separate/separate_bloc.dart';
import 'package:new_cognisong/presentation/pages/common/loadingDialog.dart';
import 'package:new_cognisong/presentation/pages/common/mission_common_success_view.dart';
import 'package:new_cognisong/presentation/pages/login/login_page.dart';
import 'package:new_cognisong/presentation/pages/module_mission/module_mission_page.dart';
import 'package:new_cognisong/presentation/pages/module_tutorial/module_tutorial_page.dart';
import 'package:new_cognisong/presentation/pages/practice/practice_page.dart';
import 'package:new_cognisong/presentation/pages/preparation_mission/preparation_mission_page.dart';
import 'package:new_cognisong/presentation/pages/preparation_tutorial/preparation_tutorial_page.dart';
import 'package:new_cognisong/presentation/pages/separate/view/separate_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeparatePage extends StatelessWidget {
  const SeparatePage({
    super.key,
    this.isFirst = true,
    this.isFromTutorial = false,
  });

  final bool isFirst;
  final bool isFromTutorial;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SeparateBloc(
            userLogoutUsecase: getIt<UserLogoutUsecase>(),
            getMissionUseCase: getIt<GetMissionUseCase>(),
            userGetUserStatUseCase: getIt<UserGetUserStatUseCase>(),
            userGetUserUseCase: getIt<UserGetUserUseCase>(),
            userSongFirstCompletedUseCase:
                getIt<UserSongFirstCompletedUseCase>(),
          )..add(
            InitSeparateEvent(isFirst: isFirst, isFromTutorial: isFromTutorial),
          ),
      child: BlocConsumer<SeparateBloc, SeparateState>(
        listener: (context, state) async {
          if (state is SeparateLoginState) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
              (route) => false,
            );
          } else if (state is SeparateNavigatorState) {
            state.count == 4
                ? context.read<SeparateBloc>().add(FinishMissionSeparateEvent())
                : state.isFromTutorial
                ? Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => state.module == 'pre'
                          ? PreParationMissionPage(
                              widgetColor: lightCoralPink,
                              type: 'pre',
                              order: state.count + 1,
                            )
                          : !state.isPracticed
                          ? PracticePage()
                          : ModuleMissionPage(
                              module: state.module,
                              order: state.count + 1,
                            ),
                    ),
                    (route) => false,
                  )
                : Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => state.module == 'pre'
                          ? state.isFirstMissionCompleted == true
                                ? PreParationMissionPage(
                                    widgetColor: lightCoralPink,
                                    type: 'pre',
                                    order: state.count + 1,
                                  )
                                : const PreParationTutorialPage()
                          : !state.isPracticed
                          ? PracticePage()
                          : state.isFirstMissionCompleted == true
                          ? ModuleMissionPage(
                              module: state.module,
                              order: state.count + 1,
                            )
                          : const ModuleTutorialPage(),
                    ),
                    (route) => false,
                  );
          } else if (state is SeparateLoadingState) {
            dialog(context);
          } else if (state is SeparateLoadedState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state is SeparateFinishState) {
            return const MissionCommonSuccessView(
              text: '미션을 완료하셨습니다. 3시간 후에 다시 시도해주세요!',
              appBarTitle: '미션 완료',
              // isAdmin: true,
            );
          } else {
            return const SeparateView();
          }
        },
      ),
    );
  }
}
