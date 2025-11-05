import 'package:audioplayers/audioplayers.dart';
import 'package:new_cognisong/utils/audio_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'module_tutorial_result_event.dart';
part 'module_tutorial_result_state.dart';

class ModuleTutorialResultBloc
    extends Bloc<ModuleTutorialResultEvent, ModuleTutorialResultState> {
  ModuleTutorialResultBloc({required AudioService audioService})
    : _audioService = audioService,
      super(ModuleTutorialResultInitState()) {
    on<InitModuleTutorialResultEvent>((event, emit) async {
      emit(
        ModuleTutorialResultLoadedState(
          offset: event.offset,
          isSuccess: event.isSuccess,
          url: event.url,
        ),
      );
      event.isSuccess
          ? await _audioService.startAndWait(AssetSource('guides/29.wav'))
          : await _audioService.startAndWait(AssetSource('guides/30.wav'));
      await Future.delayed(const Duration(seconds: 3));
      emit(ModuleTutorialResultCompleteState());
    });
  }
  final AudioService _audioService;
}
