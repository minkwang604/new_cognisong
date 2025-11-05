import 'package:audioplayers/audioplayers.dart';
import 'package:new_cognisong/core/constants/guide_url.dart';
import 'package:new_cognisong/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:new_cognisong/presentation/pages/onboarding/view/onboarding_view.dart';
import 'package:new_cognisong/presentation/pages/preparation_tutorial/preparation_tutorial_page.dart';
import 'package:new_cognisong/utils/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          OnBoardingBloc(audioService: AudioService())
            ..add(InitOnboardingEvent()),
      child: BlocConsumer<OnBoardingBloc, OnboardingState>(
        listener: (context, state) {
          state.when(
            onInit: () {},
            onLoaded: () async {
              await AudioService().startAndWait(UrlSource(onboarding_01));
            },
            onSuccess: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const PreParationTutorialPage(),
                ),
              );
            },
          );
        },
        builder: (context, state) {
          return const OnboardingView();
        },
      ),
    );
  }
}
