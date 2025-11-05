import 'package:new_cognisong/core/injection_container.dart';
import 'package:new_cognisong/domain/usecases/song/get_song_mr_parse_list_usecase.dart';
import 'package:new_cognisong/domain/usecases/song/get_song_parse_list_usecase.dart';
import 'package:new_cognisong/domain/usecases/song/get_song_usecase.dart';
import 'package:new_cognisong/presentation/blocs/preparation_tutorial/preparation_tutorial_bloc.dart';
import 'package:new_cognisong/presentation/pages/preparation_tutorial/preparation_tutorial_separate_view.dart';
import 'package:new_cognisong/presentation/pages/separate/separate_page.dart';
import 'package:new_cognisong/utils/audio_service.dart';
import 'package:new_cognisong/utils/vtt_parse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreParationTutorialPage extends StatelessWidget {
  const PreParationTutorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PreParationTutorialBloc(
        audioService: AudioService(),
        vttParse: VttParse(),
        getSongUseCase: getIt<GetSongUseCase>(),
        getSongMrParseListUsecase: getIt<GetSongMrParseListUsecase>(),
        getSongParseListUsecase: getIt<GetSongParseListUsecase>(),
      )..add(PreInitPreParationTutorialEvent()),
      child: BlocConsumer<PreParationTutorialBloc, PreParationTutorialState>(
        builder: (context, state) {
          return const PreParationTutorialSeparateView();
        },
        listener: (context, state) async {
          if (state is PreParationTutorialAllSuccessState) {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const SeparatePage(isFirst: false, isFromTutorial: true),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              ),
            );
          }
        },
      ),
    );
  }
}
