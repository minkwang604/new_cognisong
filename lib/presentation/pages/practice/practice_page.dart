import 'package:new_cognisong/presentation/blocs/practice/practice_bloc.dart';
import 'package:new_cognisong/presentation/pages/practice/practice_separate_view.dart';
import 'package:new_cognisong/utils/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PracticePage extends StatelessWidget {
  PracticePage({super.key, this.onComplete});

  VoidCallback? onComplete;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PracticeBloc(audioService: AudioService())..add(InitPracticeEvent()),
      child: BlocConsumer<PracticeBloc, PracticeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return PracticeSeparateView(onComplete: onComplete);
        },
      ),
    );
  }
}
