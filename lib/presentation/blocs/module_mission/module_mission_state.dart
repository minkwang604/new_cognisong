part of 'module_mission_bloc.dart';

abstract class ModuleMissionState extends Equatable {}

class ModuleMissionInitState extends ModuleMissionState {
  @override
  List<Object?> get props => [];
}

class ModuleMissionLoadedState extends ModuleMissionState {
  final List<List<Offset>> lines;
  final String word;
  final int wordStep;
  final List<String> wordList;
  final bool isDrawStart;
  final int currentWordIdx;
  final Map<String, num> totalData;
  final List<MapEntry<Duration, LyricEntry>> lyricEntries;
  final bool canClickFinish;
  final bool isMissionLyric;

  ModuleMissionLoadedState({
    this.lines = const [],
    this.word = '',
    this.wordList = const [],
    this.totalData = const {},
    this.wordStep = 0,
    this.currentWordIdx = -1,
    this.isDrawStart = false,
    this.lyricEntries = const [],
    this.canClickFinish = false,
    this.isMissionLyric = false,
  });
  ModuleMissionLoadedState copyWith({
    List<List<Offset>>? lines,
    bool? canClickFinish,
    String? word,
    int? wordStep,
    List<String>? wordList,
    int? currentWordIdx,
    bool? isDrawStart,
    Map<String, num>? totalData,
    List<MapEntry<Duration, LyricEntry>>? lyricEntries,
    bool? isMissionLyric,
  }) {
    return ModuleMissionLoadedState(
      canClickFinish: canClickFinish ?? this.canClickFinish,
      wordList: wordList ?? this.wordList,
      totalData: totalData ?? this.totalData,
      currentWordIdx: currentWordIdx ?? this.currentWordIdx,
      isDrawStart: isDrawStart ?? this.isDrawStart,
      lines: lines ?? this.lines,
      word: word ?? this.word,
      wordStep: wordStep ?? this.wordStep,
      lyricEntries: lyricEntries ?? this.lyricEntries,
      isMissionLyric: isMissionLyric ?? this.isMissionLyric,
    );
  }

  @override
  List<Object?> get props => [
        canClickFinish,
        lines,
        word,
        totalData,
        wordStep,
        isDrawStart,
        lyricEntries,
        currentWordIdx,
        wordList,
        isMissionLyric,
      ];
}

class ModuleMissionFailureState extends ModuleMissionState {
  @override
  List<Object?> get props => [];
}

class ModuleMissionDrawSuccessState extends ModuleMissionState {
  final List<List<Offset>> lines;
  final String url;
  ModuleMissionDrawSuccessState({
    required this.lines,
    required this.url,
  });
  @override
  List<Object?> get props => [lines, url];
}

class ModuleMissionDrawFailureState extends ModuleMissionState {
  final List<List<Offset>> lines;
  final String url;
  ModuleMissionDrawFailureState({
    required this.lines,
    required this.url,
  });
  @override
  List<Object?> get props => [lines, url];
}

class ModuleMissionSuccessState extends ModuleMissionState {
  final String info;
  final bool isAdmin;
  ModuleMissionSuccessState({required this.info, required this.isAdmin});
  @override
  List<Object?> get props => [
        info,
        isAdmin,
      ];
}

class ModuleMissionLoadingState extends ModuleMissionState {
  @override
  List<Object?> get props => [];
}

class ModuleMissionAllSuccessState extends ModuleMissionState {
  @override
  List<Object?> get props => [];
}
