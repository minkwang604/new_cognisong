part of 'preparation_tutorial_bloc.dart';

abstract class PreParationTutorialEvent extends Equatable {}

class PreInitPreParationTutorialEvent extends PreParationTutorialEvent {
  @override
  List<Object?> get props => [];
}

class InitPreParationTutorialEvent extends PreParationTutorialEvent {
  final int step;
  InitPreParationTutorialEvent({required this.step});

  @override
  List<Object?> get props => [step];
}

class LoadedPreParationTutorialEvent extends PreParationTutorialEvent {
  final int step;
  LoadedPreParationTutorialEvent({required this.step});

  @override
  List<Object?> get props => [];
}

class PositionChangePreParationTutorialEvent extends PreParationTutorialEvent {
  final Duration position;

  PositionChangePreParationTutorialEvent({required this.position});
  @override
  List<Object?> get props => [position];
}

class PauseAndResumeClickPreParationTutorialEvent
    extends PreParationTutorialEvent {
  @override
  List<Object?> get props => [];
}

class AudioResumePreParationTutorialEvent extends PreParationTutorialEvent {
  @override
  List<Object?> get props => [];
}

class AudioPausePreParationTutorialEvent extends PreParationTutorialEvent {
  @override
  List<Object?> get props => [];
}
