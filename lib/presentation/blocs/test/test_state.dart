part of 'test_bloc.dart';

class TestState {
  final int song;
  final int level;
  final String module;

  TestState({
    required this.song,
    required this.level,
    required this.module,
  });

  TestState copyWith({
    int? song,
    int? level,
    String? module,
  }) {
    return TestState(
        song: song ?? this.song,
        level: level ?? this.level,
        module: module ?? this.module);
  }

  @override
  List<Object?> get props => [
        song,
        level,
        module,
      ];
}
