import 'package:freezed_annotation/freezed_annotation.dart';

part 'song_lyric_info.freezed.dart';
part 'song_lyric_info.g.dart';

@freezed
class SongLyricInfo with _$SongLyricInfo {
  factory SongLyricInfo({
    required int total,
    required Map<int, String> changeLyric,
  }) = _SongLyricInfo;

  factory SongLyricInfo.fromJson(Map<String, dynamic> json) =>
      _$SongLyricInfoFromJson(json);
}
