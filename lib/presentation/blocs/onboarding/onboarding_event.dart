part of 'onboarding_bloc.dart';

abstract class OnboardingEvent extends Equatable {}

class OnClickNextOnboardingEvent extends OnboardingEvent {
  OnClickNextOnboardingEvent();

  @override
  List<Object?> get props => [];
}

class InitOnboardingEvent extends OnboardingEvent {
  @override
  List<Object?> get props => [];
}
