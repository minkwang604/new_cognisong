import 'package:audioplayers/audioplayers.dart';
import 'package:new_cognisong/core/constants/guide_url.dart';
import 'package:new_cognisong/utils/audio_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnBoardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnBoardingBloc({required AudioService audioService})
    : _audioService = audioService,
      super(OnboardingInitState()) {
    on<OnClickNextOnboardingEvent>((event, emit) async {
      await _audioService.startAndWait(UrlSource(onboarding_02));
      emit(OnboardingSuccessState());
    });
    on<InitOnboardingEvent>((event, emit) {
      emit(OnboardingLoadedState());
    });
  }
  final AudioService _audioService;
}
