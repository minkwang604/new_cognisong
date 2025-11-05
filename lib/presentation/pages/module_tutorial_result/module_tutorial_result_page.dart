import 'package:new_cognisong/presentation/blocs/module_tutorial_result/module_tutorial_result_bloc.dart';
import 'package:new_cognisong/presentation/pages/module_tutorial_result/view/module_tutorial_result_view.dart';
import 'package:new_cognisong/utils/audio_service.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModuleTutorialResultPage extends StatelessWidget {
  const ModuleTutorialResultPage({
    super.key,
    required this.offset,
    required this.isSuccess,
    required this.url,
  });

  final List<List<Offset>> offset;
  final bool isSuccess;
  final String url;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ModuleTutorialResultBloc(audioService: AudioService())..add(
            InitModuleTutorialResultEvent(
              offset: offset,
              url: url,
              isSuccess: isSuccess,
            ),
          ),
      child: BlocConsumer<ModuleTutorialResultBloc, ModuleTutorialResultState>(
        listener: (context, state) {
          if (state is ModuleTutorialResultCompleteState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state is ModuleTutorialResultLoadedState) {
            return ModuleTutorialResultView();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
