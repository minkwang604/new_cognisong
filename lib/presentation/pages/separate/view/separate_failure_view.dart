import 'package:new_cognisong/core/layouts/orientation_layout.dart';
import 'package:new_cognisong/presentation/blocs/separate/separate_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeparateFailureView extends StatelessWidget {
  const SeparateFailureView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeparateBloc, SeparateState>(
      builder: (context, state) {
        state as SeparateFailureState;
        return OrientationLayout(
          isRequiredPortrait: false,
          customContent: (context) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/logo_blue.png',
                          width: 60,
                          height: 70,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          '코그니송',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Text(
                          '아래 재시작 버튼을 눌러주세요!',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(82.0),
                        ),
                      ),
                      onPressed: () {
                        // context.read<SeparateBloc>().add(state.separateEvent);
                      },
                      child: const SizedBox(
                        width: 310,
                        height: 49,
                        child: Center(
                          child: Text(
                            "재시작",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
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
      },
    );
  }
}
