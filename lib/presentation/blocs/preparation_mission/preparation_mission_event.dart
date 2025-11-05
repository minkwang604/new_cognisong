part of 'preparation_mission_bloc.dart';

abstract class PreParationMissionEvent extends Equatable {}

class InitPreParationMissionEvent extends PreParationMissionEvent {
  int? songId;
  int? songLevel;
  InitPreParationMissionEvent({this.songId, this.songLevel});

  @override
  List<Object?> get props => [songId, songLevel];
}

class LoadPreParationMissionEvent extends PreParationMissionEvent {
  int? songId;
  int? songLevel;
  LoadPreParationMissionEvent({this.songId, this.songLevel});

  @override
  List<Object?> get props => [songId, songLevel];
}

class PositionChangePreParationMissionEvent extends PreParationMissionEvent {
  final Duration position;
  PositionChangePreParationMissionEvent({required this.position});

  @override
  List<Object?> get props => [position];
}

class AudioAndRecordChangeStatePreParationMissionEvent
    extends PreParationMissionEvent {
  @override
  List<Object?> get props => [];
}

class ResultPreParationMissionEvent extends PreParationMissionEvent {
  final Map<int, String> changeLyrics;
  final Song? song;
  final num score;
  final bool isAdmin;

  ResultPreParationMissionEvent({
    required this.changeLyrics,
    required this.song,
    required this.score,
    required this.isAdmin,
  });

  @override
  List<Object?> get props => [changeLyrics, song, score, isAdmin];
}

class AudioPausePreParationMissionEvent extends PreParationMissionEvent {
  @override
  List<Object?> get props => [];
}

class AudioResumePreParationMissionEvent extends PreParationMissionEvent {
  @override
  List<Object?> get props => [];
}

class AudioStopPreParationMissionEvent extends PreParationMissionEvent {
  @override
  List<Object?> get props => [];
}
