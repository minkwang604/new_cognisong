import 'package:new_cognisong/domain/entities/user.dart';
import 'package:new_cognisong/domain/usecases/user/user_login_usecase.dart';
import 'package:new_cognisong/presentation/blocs/login/login_event.dart';
import 'package:new_cognisong/presentation/blocs/login/login_state.dart';
import 'package:new_cognisong/presentation/blocs/login/login_state_props.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required UserLoginUseCase userLoginUseCase})
    : _userLoginUseCase = userLoginUseCase,
      super(const LoginLoadedState(loginStateProps: LoginStateProps())) {
    on<PressKeyCodeLoginEvent>((event, emit) {
      emit(
        LoginLoadedState(
          loginStateProps: LoginStateProps(
            code: event.code,
            isOnClickLogin: event.code != '',
          ),
        ),
      );
    });
    on<PressLoginButtonLoginEvent>((event, emit) async {
      emit(LoginLoadingState(loginStateProps: state.loginStateProps));
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final response = await _userLoginUseCase.execute(
        Login(code: state.loginStateProps.code, token: prefs.getString("code")),
      );

      await response.fold(
        (error) async {
          if (error != null) {
            emit(
              LoginFailureState(
                loginStateProps: state.loginStateProps,
                message: error.error,
              ),
            );
          }
        },
        (token) async {
          if (token != null) {
            await prefs.setString('code', token.accessToken);
            emit(LoginSuccessState(loginStateProps: state.loginStateProps));
          }
        },
      );
    });
    // on<PressButtonShowCodeEvent>((event, emit) async {
    //   print(state.loginStateProps.isShowCode);
    //   emit(LoginLoadedState(
    //       loginStateProps: state.loginStateProps
    //           .copyWith(isShowCode: !state.loginStateProps.isShowCode)));
    // });
  }

  final UserLoginUseCase _userLoginUseCase;
}
