import 'package:new_cognisong/domain/entities/module.dart';
import 'package:new_cognisong/domain/entities/song_lyric_info.dart';
import 'package:new_cognisong/domain/repositories/user_repository.dart';

class UserGetSongLyricInfoUseCase {
  final UserRepository userRepository;

  UserGetSongLyricInfoUseCase(this.userRepository);

  Future<SongLyricInfo?> execute(Module module, {int? songId}) async {
    final userStat = await userRepository.getUserStat();
    return await userRepository.getSongLyricInfo(
      songId ?? userStat!.song,
      module,
    );
  }
}
