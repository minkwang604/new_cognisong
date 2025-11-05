part of 'module_tutorial_result_bloc.dart';

abstract class ModuleTutorialResultEvent extends Equatable {}

class InitModuleTutorialResultEvent extends ModuleTutorialResultEvent {
  final List<List<Offset>> offset;
  final String url;
  final bool isSuccess;

  InitModuleTutorialResultEvent(
      {required this.offset, required this.url, required this.isSuccess});
  @override
  List<Object?> get props => [offset, url, isSuccess];
}
