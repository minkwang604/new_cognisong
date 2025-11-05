part of 'test_bloc.dart';

abstract class TestEvent extends Equatable {}

class ChangeTestEvent extends TestEvent {
  int? song;
  int? level;
  String? module;

  ChangeTestEvent({this.song, this.level, this.module});

  @override
  List<Object?> get props => [
        song,
        level,
        module,
      ];
}
