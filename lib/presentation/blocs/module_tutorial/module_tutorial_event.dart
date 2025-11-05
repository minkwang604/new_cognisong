part of 'module_tutorial_bloc.dart';

abstract class ModuleTutorialEvent extends Equatable {}

class InitModuleTutorialEvent extends ModuleTutorialEvent {
  final int step;
  InitModuleTutorialEvent({required this.step});

  @override
  List<Object?> get props => [step];
}

class LoadedAModuleTutorialEvent extends ModuleTutorialEvent {
  final int step;
  LoadedAModuleTutorialEvent({required this.step});

  @override
  List<Object?> get props => [];
}

class PositionChangeModuleTutorialEvent extends ModuleTutorialEvent {
  final Duration position;

  PositionChangeModuleTutorialEvent({required this.position});
  @override
  List<Object?> get props => [position];
}

class PauseAndResumeClickModuleTutorialEvent extends ModuleTutorialEvent {
  @override
  List<Object?> get props => [];
}

class LoadedBModuleTutorialEvent extends ModuleTutorialEvent {
  @override
  List<Object?> get props => [];
}

class RemoveDrawModuleTutorialEvent extends ModuleTutorialEvent {
  @override
  List<Object?> get props => [];
}

class StartDrawModuleTutorialEvent extends ModuleTutorialEvent {
  final Offset offset;
  StartDrawModuleTutorialEvent({required this.offset});

  @override
  List<Object?> get props => [offset];
}

class DrawingDrawModuleTutorialEvent extends ModuleTutorialEvent {
  final Offset offset;
  DrawingDrawModuleTutorialEvent({required this.offset});

  @override
  List<Object?> get props => [offset];
}

class CompleteDrawModuleTutorialEvent extends ModuleTutorialEvent {
  @override
  List<Object?> get props => [];
}

class AudioPauseModuleTutorialEvent extends ModuleTutorialEvent {
  @override
  List<Object?> get props => [];
}

class AudioResumeModuleTutorialEvent extends ModuleTutorialEvent {
  @override
  List<Object?> get props => [];
}

class PreInitModuleTutorialEvent extends ModuleTutorialEvent {
  @override
  List<Object?> get props => [];
}
