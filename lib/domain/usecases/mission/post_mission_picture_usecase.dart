import 'dart:io';

import 'package:new_cognisong/domain/entities/mission_picture.dart';
import 'package:new_cognisong/domain/repositories/mission_repository.dart';

class PostMissionPictureUsecase {
  final MissionRepository missionRepository;

  PostMissionPictureUsecase(this.missionRepository);

  Future<MissionPicture?> execute(File file, String url) async {
    return await missionRepository.postMissionPicture(file, url);
  }
}
