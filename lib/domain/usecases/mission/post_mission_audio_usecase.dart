import 'dart:io';

import 'package:new_cognisong/domain/entities/mission_audio.dart';
import 'package:new_cognisong/domain/repositories/mission_repository.dart';

class PostMissionAudioUsecase {
  final MissionRepository missionRepository;

  PostMissionAudioUsecase(this.missionRepository);

  Future<MissionAudio?> execute(File file) async {
    return await missionRepository.postMissionAudio(file);
  }
}
