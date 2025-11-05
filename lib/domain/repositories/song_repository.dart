import 'package:new_cognisong/domain/entities/song.dart';
import 'package:new_cognisong/domain/entities/song_parse.dart';
import 'package:new_cognisong/domain/entities/song_parse_mr.dart';

abstract class SongRepository {
  Future<Song?> getSong(int? songId);
  Future<SongParse?> getSongParse(int step);
  Future<SongParseMr?> getSongParseMr(int step);
  Future<SongParseMrList?> getSongParseMrList(int? songId);
  Future<SongParseList?> getSongParseList(int? songId);
}
