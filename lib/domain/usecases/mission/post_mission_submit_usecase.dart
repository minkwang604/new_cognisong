import 'package:new_cognisong/domain/entities/mission_submit.dart';
import 'package:new_cognisong/domain/repositories/mission_repository.dart';

class PostMissionSubmitUsecase {
  final MissionRepository missionRepository;

  PostMissionSubmitUsecase(this.missionRepository);

  Future<MissionSubmitResponse?> execute(MissionSubmit missionSubmit) async {
    return await missionRepository.postMissionSubmit(missionSubmit);
  }
}
