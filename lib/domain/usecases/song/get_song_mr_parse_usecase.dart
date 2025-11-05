import 'package:new_cognisong/domain/entities/song_parse_mr.dart';
import 'package:new_cognisong/domain/repositories/song_repository.dart';

class GetSongMrParseUseCase {
  final SongRepository songRepository;

  GetSongMrParseUseCase(this.songRepository);

  Future<SongParseMr?> execute(int step) async {
    return await songRepository.getSongParseMr(step);
  }
}
