import 'package:new_cognisong/data/datasources/song_api_client.dart';
import 'package:new_cognisong/domain/entities/song.dart';
import 'package:new_cognisong/domain/entities/song_parse.dart';
import 'package:new_cognisong/domain/entities/song_parse_mr.dart';
import 'package:new_cognisong/domain/repositories/song_repository.dart';
import 'package:dio/dio.dart';

class SongRepositoryImpl implements SongRepository {
  final SongApiClient _songApiClient;
  SongRepositoryImpl(this._songApiClient);

  @override
  Future<Song?> getSong(int? songId) async {
    try {
      final songResponse = await _songApiClient.getSong(songId);

      if (songResponse.response.statusCode == 200) {
        return Song.fromJson(songResponse.data);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return null;
      }
    }
    return null;
  }

  @override
  Future<SongParse?> getSongParse(int step) async {
    try {
      final songResponse = await _songApiClient.getSongParse(step);

      if (songResponse.response.statusCode == 200) {
        return SongParse.fromJson(songResponse.data);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return null;
      }
    }
    return null;
  }

  @override
  Future<SongParseList?> getSongParseList(int? songId) async {
    try {
      final songParseListData = await _songApiClient.getSongParseList(songId);

      if (songParseListData.response.statusCode == 200) {
        final songParseMrList = List<SongParse>.from(
          songParseListData.data['songParseList'].map(
            (json) => SongParse.fromJson(json),
          ),
        );
        return SongParseList(songParseList: songParseMrList);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return null;
      }
    }
    return null;
  }

  @override
  Future<SongParseMr?> getSongParseMr(int step) async {
    try {
      final songResponse = await _songApiClient.getSongParseMr(step);

      if (songResponse.response.statusCode == 200) {
        return SongParseMr.fromJson(songResponse.data);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return null;
      }
    }
    return null;
  }

  @override
  Future<SongParseMrList?> getSongParseMrList(int? songId) async {
    try {
      final songMrListResponse = await _songApiClient.getSongParseMrList(
        songId,
      );
      if (songMrListResponse.response.statusCode == 200) {
        final songParseMrList = List<SongParseMr>.from(
          songMrListResponse.data['songList'].map(
            (json) => SongParseMr.fromJson(json),
          ),
        );
        return SongParseMrList(songParseMrList: songParseMrList);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return null;
      }
    }
    return null;
  }
}
