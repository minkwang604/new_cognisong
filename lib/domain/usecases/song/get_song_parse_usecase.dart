import 'package:new_cognisong/domain/entities/song_parse.dart';
import 'package:new_cognisong/domain/repositories/song_repository.dart';

class GetSongParseUseCase {
  final SongRepository songRepository;

  GetSongParseUseCase(this.songRepository);

  Future<SongParse?> execute(int step) async {
    return await songRepository.getSongParse(step);
  }
}
