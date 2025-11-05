import 'package:new_cognisong/domain/entities/song_parse_mr.dart';
import 'package:new_cognisong/domain/repositories/song_repository.dart';

class GetSongMrParseListUsecase {
  final SongRepository songRepository;

  GetSongMrParseListUsecase(this.songRepository);

  Future<SongParseMrList?> execute({int? songId}) async {
    return await songRepository.getSongParseMrList(songId);
  }
}
