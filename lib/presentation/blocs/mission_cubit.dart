import 'package:audioplayers/audioplayers.dart';
import 'package:new_cognisong/utils/audio_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MissionState {
  final bool checking;
  MissionState({required this.checking});
}

class MissionCubit extends Cubit<MissionState> {
  final AudioService _audioService = AudioService();
  MissionCubit() : super(MissionState(checking: true));

  Future<void> start(int order) async {
    if (order == 1) {
      await _audioService.startAndWait(
        AssetSource('guides/new_4.wav'),
        second: 2,
      );
    }

    emit(MissionState(checking: false));
  }
}
