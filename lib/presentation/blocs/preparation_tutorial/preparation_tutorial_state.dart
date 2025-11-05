part of 'preparation_tutorial_bloc.dart';

abstract class PreParationTutorialState extends Equatable {
  final int step;

  const PreParationTutorialState({
    required this.step,
  });
}

class PreParationTutorialPreInitState extends PreParationTutorialState {
  const PreParationTutorialPreInitState({super.step = 0});

  @override
  List<Object?> get props => [];
}

class PreParationTutorialInitState extends PreParationTutorialState {
  const PreParationTutorialInitState({required super.step});

  void onInit({required Function() init}) {
    init();
  }

  @override
  List<Object?> get props => [];
}

class PreParationTutorialFailureState extends PreParationTutorialState {
  const PreParationTutorialFailureState({required super.step});

  @override
  List<Object?> get props => [step];
}

class PreParationTutorialLoadingState extends PreParationTutorialState {
  const PreParationTutorialLoadingState({required super.step});
  @override
  List<Object?> get props => [];
}

class PreParationTutorialLoadedState extends PreParationTutorialState {
  //위
  final String title;
  //가사
  final int lyricPositionIndex;
  final Duration currentPosition;
  final Duration totalPosition;
  final List<MapEntry<Duration, LyricEntry>> lyricEntries;
  final int lyricsLine;
  final bool isAudioStart;
  //3,2,1 count
  final int countDownValue;

  void onGuide({required Function() onGuide}) {
    onGuide;
  }

  const PreParationTutorialLoadedState({
    this.title = '',
    this.currentPosition = const Duration(),
    this.totalPosition = const Duration(),
    this.lyricEntries = const [],
    this.lyricPositionIndex = -1,
    this.lyricsLine = -1,
    required super.step,
    this.countDownValue = -1,
    this.isAudioStart = false,
  });

  PreParationTutorialLoadedState copyWith({
    String? title,
    int? lyricPositionIndex,
    Duration? currentPosition,
    Duration? totalPosition,
    List<MapEntry<Duration, LyricEntry>>? lyricEntries,
    int? lyricsLine,
    int? countDownValue,
    bool? isAudioStart,
  }) {
    return PreParationTutorialLoadedState(
      title: title ?? this.title,
      lyricPositionIndex: lyricPositionIndex ?? this.lyricPositionIndex,
      currentPosition: currentPosition ?? this.currentPosition,
      totalPosition: totalPosition ?? this.totalPosition,
      lyricEntries: lyricEntries ?? this.lyricEntries,
      lyricsLine: lyricsLine ?? this.lyricsLine,
      countDownValue: countDownValue ?? this.countDownValue,
      step: step,
      isAudioStart: isAudioStart ?? this.isAudioStart,
    );
  }

  @override
  List<Object?> get props => [
        title,
        lyricEntries,
        lyricPositionIndex,
        currentPosition,
        totalPosition,
        lyricsLine,
        countDownValue,
        step,
        isAudioStart
      ];
}

class PreParationTutorialSuccessState extends PreParationTutorialState {
  const PreParationTutorialSuccessState({required super.step});
  @override
  List<Object?> get props => [];
}

class PreParationTutorialAllSuccessState extends PreParationTutorialState {
  const PreParationTutorialAllSuccessState({required super.step});

  @override
  List<Object?> get props => [];
}
