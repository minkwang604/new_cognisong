import 'package:new_cognisong/core/layouts/orientation_layout.dart';
import 'package:new_cognisong/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationLayout(
      isRequiredPortrait: false,
      customContent: (context) {
        return Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    Image.asset(
                      'assets/images/check.png',
                      width: 38,
                      height: 38,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '잘하셨어요!',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "이제 시작해볼까요?",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(82.0),
                    ),
                  ),
                  onPressed: () {
                    context.read<OnBoardingBloc>().add(
                      OnClickNextOnboardingEvent(),
                    );
                  },
                  child: const SizedBox(
                    width: 310,
                    height: 49,
                    child: Center(
                      child: Text(
                        "시작하기",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
