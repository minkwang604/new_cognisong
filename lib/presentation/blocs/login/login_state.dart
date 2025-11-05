import 'package:new_cognisong/presentation/blocs/login/login_state_props.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  void when({
    required Function() onSuccess,
    required Function() onLoading,
    required Function() onFailure,
    required Function() onLoaded,
  });

  final LoginStateProps loginStateProps;

  const LoginState({required this.loginStateProps});

  LoginState copyWith({LoginStateProps? loginStateProps});
}

class LoginLoadedState extends LoginState {
  const LoginLoadedState({required super.loginStateProps});

  @override
  List<Object?> get props => [loginStateProps];

  @override
  LoginLoadedState copyWith({LoginStateProps? loginStateProps}) {
    return LoginLoadedState(
      loginStateProps: loginStateProps ?? this.loginStateProps,
    );
  }

  @override
  void when({
    required Function() onSuccess,
    required Function() onLoading,
    required Function() onFailure,
    required Function() onLoaded,
  }) {
    onLoaded();
  }
}

class LoginSuccessState extends LoginState {
  const LoginSuccessState({required super.loginStateProps});

  @override
  LoginSuccessState copyWith({LoginStateProps? loginStateProps}) {
    return LoginSuccessState(
      loginStateProps: loginStateProps ?? this.loginStateProps,
    );
  }

  @override
  List<Object?> get props => [loginStateProps];

  @override
  void when({
    required Function() onSuccess,
    required Function() onLoading,
    required Function() onFailure,
    required Function() onLoaded,
  }) {
    onSuccess();
  }
}

class LoginFailureState extends LoginState {
  final String message;

  const LoginFailureState({required super.loginStateProps, this.message = ''});
  @override
  LoginFailureState copyWith({
    LoginStateProps? loginStateProps,
    String? message,
  }) {
    return LoginFailureState(
      loginStateProps: loginStateProps ?? this.loginStateProps,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [message, loginStateProps];

  @override
  void when({
    required Function() onSuccess,
    required Function() onLoading,
    required Function() onFailure,
    required Function() onLoaded,
  }) {
    onFailure();
  }
}

class LoginLoadingState extends LoginState {
  const LoginLoadingState({required super.loginStateProps});

  @override
  List<Object?> get props => [loginStateProps];

  @override
  LoginLoadingState copyWith({LoginStateProps? loginStateProps}) {
    return LoginLoadingState(
      loginStateProps: loginStateProps ?? this.loginStateProps,
    );
  }

  @override
  void when({
    required Function() onSuccess,
    required Function() onLoading,
    required Function() onFailure,
    required Function() onLoaded,
  }) {
    onLoading();
  }
}
