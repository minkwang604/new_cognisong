part of 'module_tutorial_bloc.dart';

abstract class ModuleTutorialState extends Equatable {
  final int step;

  const ModuleTutorialState({
    required this.step,
  });
}

class ModuleTutorialPreInitState extends ModuleTutorialState {
  const ModuleTutorialPreInitState({required super.step});
  @override
  List<Object?> get props => [];
}

class ModuleTutorialInitState extends ModuleTutorialState {
  const ModuleTutorialInitState({required super.step});

  void onInit({required Function() init}) {
    init();
  }

  @override
  List<Object?> get props => [];
}

class ModuleTutorialFailureState extends ModuleTutorialState {
  const ModuleTutorialFailureState({required super.step});

  @override
  List<Object?> get props => [step];
}

class ModuleTutorialLoadingState extends ModuleTutorialState {
  const ModuleTutorialLoadingState({required super.step});
  @override
  List<Object?> get props => [];
}

class ModuleTutorialLoadedState extends ModuleTutorialState {
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

  //draw 영역
  final List<List<Offset>> lines;
  final String word;
  final int wordStep;
  final bool isDrawStart;
  final bool canClickFinish;

  void onGuide({required Function() onGuide}) {
    onGuide;
  }

  const ModuleTutorialLoadedState({
    this.canClickFinish = false,
    this.lines = const [],
    this.title = '',
    this.currentPosition = const Duration(),
    this.totalPosition = const Duration(),
    this.lyricEntries = const [],
    this.lyricPositionIndex = -1,
    this.lyricsLine = -1,
    required super.step,
    this.countDownValue = -1,
    this.isAudioStart = false,
    this.word = '',
    this.wordStep = 0,
    this.isDrawStart = false,
  });

  ModuleTutorialLoadedState copyWith({
    String? title,
    int? lyricPositionIndex,
    Duration? currentPosition,
    Duration? totalPosition,
    List<MapEntry<Duration, LyricEntry>>? lyricEntries,
    int? lyricsLine,
    int? countDownValue,
    bool? isAudioStart,
    List<List<Offset>>? lines,
    String? word,
    int? wordStep,
    bool? isDrawStart,
    bool? canClickFinish,
  }) {
    return ModuleTutorialLoadedState(
      canClickFinish: canClickFinish ?? this.canClickFinish,
      title: title ?? this.title,
      lyricPositionIndex: lyricPositionIndex ?? this.lyricPositionIndex,
      currentPosition: currentPosition ?? this.currentPosition,
      totalPosition: totalPosition ?? this.totalPosition,
      lyricEntries: lyricEntries ?? this.lyricEntries,
      lyricsLine: lyricsLine ?? this.lyricsLine,
      countDownValue: countDownValue ?? this.countDownValue,
      step: step,
      isAudioStart: isAudioStart ?? this.isAudioStart,
      lines: lines ?? this.lines,
      word: word ?? this.word,
      wordStep: wordStep ?? this.wordStep,
      isDrawStart: isDrawStart ?? this.isDrawStart,
    );
  }

  @override
  List<Object?> get props => [
        canClickFinish,
        title,
        lyricEntries,
        lyricPositionIndex,
        currentPosition,
        totalPosition,
        lyricsLine,
        countDownValue,
        step,
        isAudioStart,
        lines,
        word,
        wordStep,
        isDrawStart
      ];
}

class ModuleTutorialSuccessState extends ModuleTutorialState {
  const ModuleTutorialSuccessState({required super.step});
  @override
  List<Object?> get props => [];
}

class ModuleTutorialAllSuccessState extends ModuleTutorialState {
  const ModuleTutorialAllSuccessState({required super.step});

  @override
  List<Object?> get props => [];
}

class ModuleTutorialDrawSuccessState extends ModuleTutorialState {
  final List<List<Offset>> lines;
  final String url;
  const ModuleTutorialDrawSuccessState(
      {required super.step, required this.lines, required this.url});

  @override
  List<Object?> get props => [lines, url];
}

class ModuleTutorialDrawFailureState extends ModuleTutorialState {
  final List<List<Offset>> lines;
  final String url;

  const ModuleTutorialDrawFailureState(
      {required super.step, required this.lines, required this.url});

  @override
  List<Object?> get props => [lines, url];
}
