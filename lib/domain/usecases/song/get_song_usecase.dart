import 'package:new_cognisong/domain/entities/song.dart';
import 'package:new_cognisong/domain/repositories/song_repository.dart';

class GetSongUseCase {
  final SongRepository songRepository;

  GetSongUseCase(this.songRepository);

  Future<Song?> execute({int? songId}) async {
    return await songRepository.getSong(songId);
  }
}
