part of 'preparation_mission_bloc.dart';

abstract class PreParationMissionState extends Equatable {}

class PreParationMissionInitState extends PreParationMissionState {
  @override
  List<Object?> get props => [];
}

class PreParationMissionLoadedState extends PreParationMissionState {
  final String title;
  final int lyricPositionIndex;
  final Duration currentPosition;
  final Duration totalPosition;
  final List<MapEntry<Duration, LyricEntry>> lyricEntries;
  final bool isAudioStart;

  final int countDownValue;

  PreParationMissionLoadedState({
    this.title = '',
    this.lyricPositionIndex = -1,
    this.currentPosition = const Duration(),
    this.totalPosition = const Duration(),
    this.lyricEntries = const [],
    this.isAudioStart = false,
    this.countDownValue = -1,
  });

  PreParationMissionLoadedState copyWith({
    Duration? currentPosition,
    Duration? totalPosition,
    List<MapEntry<Duration, LyricEntry>>? lyricEntries,
    bool? isAudioStart,
    String? title,
    int? lyricPositionIndex,
    int? countDownValue,
  }) {
    return PreParationMissionLoadedState(
      totalPosition: totalPosition ?? this.totalPosition,
      currentPosition: currentPosition ?? this.currentPosition,
      lyricEntries: lyricEntries ?? this.lyricEntries,
      lyricPositionIndex: lyricPositionIndex ?? this.lyricPositionIndex,
      title: title ?? this.title,
      isAudioStart: isAudioStart ?? this.isAudioStart,
      countDownValue: countDownValue ?? this.countDownValue,
    );
  }

  @override
  List<Object?> get props => [
        lyricEntries,
        lyricPositionIndex,
        currentPosition,
        totalPosition,
        title,
        isAudioStart,
        countDownValue,
      ];
}

class PreParationMissionLoadingState extends PreParationMissionState {
  @override
  List<Object?> get props => [];
}

class PreParationMissionResultInitState extends PreParationMissionState {
  @override
  List<Object?> get props => [];
}

class PreParationMissionResultState extends PreParationMissionState {
  final Duration currentPosition;
  final Duration totalPosition;
  final List<MapEntry<Duration, LyricEntry>> lyricEntries;
  final Map<int, String> changeLyrics;
  final int lyricPositionIndex;
  final List<int> lyricsLines;

  PreParationMissionResultState({
    this.currentPosition = const Duration(),
    this.totalPosition = const Duration(),
    this.lyricPositionIndex = -1,
    this.lyricsLines = const [],
    required this.changeLyrics,
    this.lyricEntries = const [],
  });

  PreParationMissionResultState copyWith({
    Duration? currentPosition,
    Duration? totalPosition,
    List<int>? lyricsLines,
    List<MapEntry<Duration, LyricEntry>>? lyricEntries,
    Map<int, String>? changeLyrics,
    int? lyricPositionIndex,
  }) {
    return PreParationMissionResultState(
      lyricsLines: lyricsLines ?? this.lyricsLines,
      currentPosition: currentPosition ?? this.currentPosition,
      totalPosition: totalPosition ?? this.totalPosition,
      lyricEntries: lyricEntries ?? this.lyricEntries,
      lyricPositionIndex: lyricPositionIndex ?? this.lyricPositionIndex,
      changeLyrics: changeLyrics ?? this.changeLyrics,
    );
  }

  @override
  List<Object?> get props => [
        currentPosition,
        totalPosition,
        lyricEntries,
        lyricPositionIndex,
        changeLyrics,
        lyricsLines,
      ];
}

class PreParationMissionFailureState extends PreParationMissionState {
  @override
  List<Object?> get props => [];
}

class PreParationMissionCompleteState extends PreParationMissionState {
  final num score;
  final String info;
  final bool isAdmin;
  PreParationMissionCompleteState(
      {required this.score, required this.info, required this.isAdmin});

  @override
  List<Object?> get props => [score, info, isAdmin];
}

class PreParationMissionFinalCompleteState extends PreParationMissionState {
  @override
  List<Object?> get props => [];
}
