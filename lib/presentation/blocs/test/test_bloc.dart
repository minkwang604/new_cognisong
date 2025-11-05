import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() : super(TestState(song: 0, level: 1, module: 'A')) {
    on<ChangeTestEvent>((event, emit) {
      emit(state.copyWith(
          song: event.song ?? state.song,
          level: event.level ?? state.level,
          module: event.module ?? state.module));
    });
  }
}
