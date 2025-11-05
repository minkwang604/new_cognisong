part of 'module_mission_bloc.dart';

abstract class ModuleMissionEvent extends Equatable {}

class InitModuleMissionEvent extends ModuleMissionEvent {
  int? songId;
  int? songLevel;
  InitModuleMissionEvent({this.songId, this.songLevel});

  @override
  List<Object?> get props => [songId, songLevel];
}

class LoadedModuleTutorialEvent extends ModuleMissionEvent {
  int? songId;
  int? songLevel;
  LoadedModuleTutorialEvent({this.songId, this.songLevel});
  @override
  List<Object?> get props => [songId, songLevel];
}

class RemoveDrawModuleMissionEvent extends ModuleMissionEvent {
  @override
  List<Object?> get props => [];
}

class StartDrawModuleMissionEvent extends ModuleMissionEvent {
  final Offset offset;
  StartDrawModuleMissionEvent({required this.offset});

  @override
  List<Object?> get props => [offset];
}

class DrawingDrawModuleMissionEvent extends ModuleMissionEvent {
  final Offset offset;
  DrawingDrawModuleMissionEvent({required this.offset});

  @override
  List<Object?> get props => [offset];
}

class CompleteDrawModuleMissionEvent extends ModuleMissionEvent {
  @override
  List<Object?> get props => [];
}

class CompleteDrawAllModuleMissionEvent extends ModuleMissionEvent {
  final Map<int, String> changeLyrics;
  final int songId;
  final bool isAdmin;
  final bool isPractice;
  CompleteDrawAllModuleMissionEvent({
    required this.changeLyrics,
    required this.songId,
    required this.isAdmin,
    required this.isPractice,
  });
  @override
  List<Object?> get props => [changeLyrics, songId, isAdmin, isPractice];
}

class AudioResumeModuleMissionEvent extends ModuleMissionEvent {
  @override
  List<Object?> get props => [];
}

class AudioPauseModuleMissionEvent extends ModuleMissionEvent {
  @override
  List<Object?> get props => [];
}

class AudioStopModuleMissionEvent extends ModuleMissionEvent {
  @override
  List<Object?> get props => [];
}
