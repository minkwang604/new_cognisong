import 'package:audioplayers/audioplayers.dart';
import 'package:new_cognisong/utils/audio_service.dart';
import 'package:new_cognisong/utils/record_service.dart';

class MissionService {
  final AudioService _audioService;
  final RecordService _recordService;

  MissionService(this._audioService, this._recordService);

  Future<void> initMission(
    String audioPath,
    Duration delay,
    Function() onComplete,
  ) async {
    await _audioService.startAndWait(AssetSource(audioPath));
    await Future.delayed(delay);
    onComplete();
  }

  Future<void> LoadMission(String audioPath) async {
    await _audioService.startAndWait(AssetSource(audioPath));
  }
}
