part of 'onboarding_bloc.dart';

abstract class OnboardingState extends Equatable {
  void when({
    required Function() onInit,
    required Function() onSuccess,
    required Function() onLoaded,
  });
}

class OnboardingInitState extends OnboardingState {
  @override
  void when({
    required Function() onInit,
    required Function() onSuccess,
    required Function() onLoaded,
  }) {
    onInit();
  }

  @override
  List<Object?> get props => [];
}

class OnboardingLoadedState extends OnboardingState {
  @override
  void when({
    required Function() onInit,
    required Function() onSuccess,
    required Function() onLoaded,
  }) {
    onLoaded();
  }

  @override
  List<Object?> get props => [];
}

class OnboardingSuccessState extends OnboardingState {
  @override
  void when({
    required Function() onInit,
    required Function() onSuccess,
    required Function() onLoaded,
  }) {
    onSuccess();
  }

  @override
  List<Object?> get props => [];
}
