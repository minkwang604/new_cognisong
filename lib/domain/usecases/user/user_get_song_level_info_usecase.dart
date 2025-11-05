import 'package:new_cognisong/domain/entities/module.dart';
import 'package:new_cognisong/domain/entities/song_level_info.dart';
import 'package:new_cognisong/domain/repositories/user_repository.dart';

class UserGetSongLevelInfoUseCase {
  final UserRepository userRepository;

  UserGetSongLevelInfoUseCase(this.userRepository);

  Future<SongLevelInfo?> execute(Module module, {int? songLevel}) async {
    final userStat = await userRepository.getUserStat();
    return await userRepository.getSongLevelInfo(
      songLevel ?? userStat!.level,
      module,
    );
  }
}
