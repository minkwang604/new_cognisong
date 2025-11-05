part of 'module_tutorial_result_bloc.dart';

abstract class ModuleTutorialResultState extends Equatable {}

class ModuleTutorialResultInitState extends ModuleTutorialResultState {
  @override
  List<Object?> get props => [];
}

class ModuleTutorialResultLoadedState extends ModuleTutorialResultState {
  final List<List<Offset>> offset;
  final String url;
  final bool isSuccess;

  ModuleTutorialResultLoadedState({
    required this.offset,
    required this.url,
    required this.isSuccess,
  });

  @override
  List<Object?> get props => [offset, url, isSuccess];
}

class ModuleTutorialResultCompleteState extends ModuleTutorialResultState {
  @override
  List<Object?> get props => [];
}
