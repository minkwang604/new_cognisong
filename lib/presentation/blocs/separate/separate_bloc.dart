import 'package:new_cognisong/domain/usecases/mission/get_mission_usecase.dart';
import 'package:new_cognisong/domain/usecases/user/user_get_user_stat_usecase.dart';
import 'package:new_cognisong/domain/usecases/user/user_get_user_usecase.dart';
import 'package:new_cognisong/domain/usecases/user/user_logout_usecase.dart';
import 'package:new_cognisong/domain/usecases/user/user_song_first_completed_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'separate_event.dart';
part 'separate_state.dart';

class SeparateBloc extends Bloc<SeparateEvent, SeparateState> {
  SeparateBloc({
    required GetMissionUseCase getMissionUseCase,
    required UserGetUserUseCase userGetUserUseCase,
    required UserSongFirstCompletedUseCase userSongFirstCompletedUseCase,
    required UserGetUserStatUseCase userGetUserStatUseCase,
    required UserLogoutUsecase userLogoutUsecase,
  }) : _userGetUserUseCase = userGetUserUseCase,
       _getMissionUseCase = getMissionUseCase,
       _userGetUserStatUseCase = userGetUserStatUseCase,
       _userLogoutUseCase = userLogoutUsecase,
       super(SeparateInitState()) {
    on<InitSeparateEvent>((event, emit) async {
      emit(SeparateLoadingState());
      final userStat = await _userGetUserStatUseCase.execute();
      if (event.isFirst) {
        final response = await _userGetUserUseCase.execute();

        if (response == null) {
          emit(SeparateLoginState());
        } else {
          final mission = await _getMissionUseCase.execute();

          if (mission == null) {
            emit(
              SeparateLoadedState(
                isUser: response.userType == 'admin' ? false : true,
                text: '조금 뒤에 다시 접속해주세요',
                isModule: userStat == null
                    ? false
                    : userStat.isPracticed
                    ? true
                    : false,
              ),
            );
          } else {
            emit(
              SeparateLoadedState(
                isUser: mission.isUser,
                isModule: userStat == null
                    ? false
                    : userStat.isPracticed
                    ? true
                    : false,
              ),
            );
          }
        }
      } else {
        final mission = await _getMissionUseCase.execute();
        if (mission == null) {
          final response = await _userGetUserUseCase.execute();
          if (response == null) {
            emit(SeparateLoginState());
          } else {
            final userStat = await _userGetUserStatUseCase.execute();
            emit(
              SeparateLoadedState(
                isUser: response.userType == 'admin' ? false : true,
                text: '조금 뒤에 다시 접속해주세요',
                isModule: userStat == null
                    ? false
                    : userStat.isPracticed
                    ? true
                    : false,
              ),
            );
          }
        } else {
          final response = await _userGetUserStatUseCase.execute();
          mission.lastOrder != 0
              ? await Future.delayed(const Duration(seconds: 2))
              : null;
          if (response == null) {
            emit(SeparateLoginState());
          } else {
            emit(
              SeparateNavigatorState(
                isPracticed: response.isPracticed,
                isFromTutorial: event.isFromTutorial,
                module: mission.module,
                isFirstMissionCompleted: mission.isFirstMissionCompleted,
                song: mission.song,
                isUser: mission.isUser,
                count: mission.lastOrder,
              ),
            );
          }
        }
      }
    });

    on<FinishMissionSeparateEvent>((event, emit) {
      emit(SeparateFinishState());
    });

    on<LogoutEvent>((event, emit) {
      _userLogoutUseCase.execute(event.token);
    });
  }

  final UserGetUserUseCase _userGetUserUseCase;
  final UserGetUserStatUseCase _userGetUserStatUseCase;
  final GetMissionUseCase _getMissionUseCase;
  final UserLogoutUsecase _userLogoutUseCase;
}
