import 'dart:io';

import 'package:new_cognisong/domain/entities/mission.dart';
import 'package:new_cognisong/domain/entities/mission_audio.dart';
import 'package:new_cognisong/domain/entities/mission_picture.dart';
import 'package:new_cognisong/domain/entities/mission_submit.dart';

abstract class MissionRepository {
  Future<MissionAudio?> postMissionAudio(File file);
  Future<MissionSubmitResponse?> postMissionSubmit(MissionSubmit missionSubmit);
  Future<MissionPicture?> postMissionPicture(File file, String url);
  Future<Mission?> getMission();
}
