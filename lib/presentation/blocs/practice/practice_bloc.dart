import 'package:audioplayers/audioplayers.dart';
import 'package:new_cognisong/utils/audio_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'practice_event.dart';
part 'practice_state.dart';

class PracticeBloc extends Bloc<PracticeEvent, PracticeState> {
  PracticeBloc({required AudioService audioService})
    : _audioService = audioService,
      super(InitPracticeState()) {
    on<InitPracticeEvent>((event, emit) async {
      emit(PrePracticeState());
      await _audioService.startAndWait(AssetSource('guides/new_2.wav'));
      emit(ModuleAPracticeState());
      // emit(ModuleBPracticeState());
    });
    on<ModuleBPracticeEvent>((event, emit) async {
      emit(ModuleBPracticeState());
    });
  }
  final AudioService _audioService;
}
