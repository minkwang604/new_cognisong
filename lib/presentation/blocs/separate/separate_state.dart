part of 'separate_bloc.dart';

abstract class SeparateState extends Equatable {}

// 미션 시작하기 화면으로 보내기

class SeparateInitState extends SeparateState {
  @override
  List<Object?> get props => [];
}

class SeparateLoginState extends SeparateState {
  @override
  List<Object?> get props => [];
}

// 초기 State
class SeparateLoadingState extends SeparateState {
  @override
  List<Object?> get props => [];
}

class SeparateFailureState extends SeparateState {
  final String error;

  SeparateFailureState({required this.error});
  @override
  List<Object?> get props => [error];
}

class SeparateLoadedState extends SeparateState {
  final bool isUser;
  final String text;
  final bool isModule;

  SeparateLoadedState({
    required this.isUser,
    this.text = '',
    required this.isModule,
  });

  SeparateLoadedState copyWith({bool? isUser, String? text, bool? isModule}) {
    return SeparateLoadedState(
      isUser: isUser ?? this.isUser,
      text: text ?? this.text,
      isModule: isModule ?? this.isModule,
    );
  }

  @override
  List<Object?> get props => [
        isUser,
        text,
        isModule,
      ];
}

class SeparateNavigatorState extends SeparateState {
  final bool isPracticed;
  final String module;
  final bool isFirstMissionCompleted;
  final int song;
  final bool isUser;
  final int count;
  final bool isFromTutorial;

  SeparateNavigatorState({
    required this.isPracticed,
    required this.module,
    required this.isFirstMissionCompleted,
    required this.song,
    required this.isUser,
    required this.count,
    required this.isFromTutorial,
  });

  SeparateNavigatorState copyWith({
    bool? isPracticed,
    String? module,
    bool? isFirstMissionCompleted,
    int? song,
    bool? isUser,
    int? count,
    bool? isFirst,
    bool? isFromTutorial,
    bool? gotoPractice,
  }) {
    return SeparateNavigatorState(
      isPracticed: isPracticed ?? this.isPracticed,
      isFromTutorial: isFromTutorial ?? this.isFromTutorial,
      song: song ?? this.song,
      isFirstMissionCompleted:
          isFirstMissionCompleted ?? this.isFirstMissionCompleted,
      isUser: isUser ?? this.isUser,
      module: module ?? this.module,
      count: count ?? this.count,
    );
  }

  @override
  List<Object?> get props => [
        module,
        isPracticed,
        isFirstMissionCompleted,
        song,
        isUser,
        count,
        isFromTutorial,
      ];
}

class SeparateFinishState extends SeparateState {
  @override
  List<Object?> get props => [];
}
