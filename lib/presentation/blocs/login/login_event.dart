import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class PressKeyCodeLoginEvent extends LoginEvent {
  final String code;

  const PressKeyCodeLoginEvent({this.code = ''});

  @override
  List<Object?> get props => [code];
}

class PressButtonShowCodeEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}
// class PressKeyPasswordLoginEvent extends LoginEvent {
//   final String password;
//   const PressKeyPasswordLoginEvent({this.password = ''});

//   @override
//   List<Object?> get props => [password];
// }

// class PressPasswordVisibleButtonLoginEvent extends LoginEvent {
//   @override
//   List<Object?> get props => [];
// }

class PressLoginButtonLoginEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}

// class PressAutoLoginButtonLoginEvent extends LoginEvent {
//   @override
//   List<Object?> get props => [];
// }
