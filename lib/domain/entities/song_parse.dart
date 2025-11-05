import 'package:freezed_annotation/freezed_annotation.dart';

part 'song_parse.freezed.dart';
part 'song_parse.g.dart';

@freezed
class SongParse with _$SongParse {
  factory SongParse({
    required int id,
    @JsonKey(name: 'song_id') required int songId,
    required int step,
    required String url,
    @JsonKey(name: "vtt_url") required String vttUrl,
  }) = _SongParse;

  factory SongParse.fromJson(Map<String, dynamic> json) =>
      _$SongParseFromJson(json);
}

@freezed
class SongParseList with _$SongParseList {
  factory SongParseList({
    required List<SongParse> songParseList,
  }) = _SongParseList;

  factory SongParseList.fromJson(Map<String, dynamic> json) =>
      _$SongParseListFromJson(json);
}
