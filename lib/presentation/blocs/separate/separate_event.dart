part of 'separate_bloc.dart';

abstract class SeparateEvent extends Equatable {}

class InitSeparateEvent extends SeparateEvent {
  final bool isFirst;
  final bool isFromTutorial;

  InitSeparateEvent({
    required this.isFirst,
    this.isFromTutorial = false,
  });
  @override
  List<Object?> get props => [isFirst, isFromTutorial];
}

class LoadMissionSeparateEvent extends SeparateEvent {
  @override
  List<Object?> get props => [];
}

class ClickMissionSeparateEvent extends SeparateEvent {
  final int? count;
  ClickMissionSeparateEvent({this.count});
  @override
  List<Object?> get props => [count];
}

class FinishMissionSeparateEvent extends SeparateEvent {
  @override
  List<Object?> get props => [];
}

class LogoutEvent extends SeparateEvent {
  final String token;
  LogoutEvent({required this.token});

  @override
  List<Object?> get props => [token];
}
