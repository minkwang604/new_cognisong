import 'package:new_cognisong/domain/entities/mission.dart';
import 'package:new_cognisong/domain/repositories/mission_repository.dart';

class GetMissionUseCase {
  final MissionRepository missionRepository;

  GetMissionUseCase(this.missionRepository);

  Future<Mission?> execute() async {
    return await missionRepository.getMission();
  }
}
