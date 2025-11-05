import 'package:new_cognisong/domain/entities/song_parse.dart';
import 'package:new_cognisong/domain/repositories/song_repository.dart';

class GetSongParseListUsecase {
  final SongRepository songRepository;

  GetSongParseListUsecase(this.songRepository);

  Future<SongParseList?> execute({int? songId}) async {
    return await songRepository.getSongParseList(songId);
  }
}
