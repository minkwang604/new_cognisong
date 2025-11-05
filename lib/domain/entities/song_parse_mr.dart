import 'package:freezed_annotation/freezed_annotation.dart';

part 'song_parse_mr.freezed.dart';
part 'song_parse_mr.g.dart';

@freezed
class SongParseMr with _$SongParseMr {
  factory SongParseMr({
    required int id,
    required int step,
    @JsonKey(name: 'song_id') required int songId,
    @JsonKey(name: 'mr_url') required String mrUrl,
    @JsonKey(name: "vtt_url") required String vttUrl,
  }) = _SongParseMr;

  factory SongParseMr.fromJson(Map<String, dynamic> json) =>
      _$SongParseMrFromJson(json);
}

@freezed
class SongParseMrList with _$SongParseMrList {
  factory SongParseMrList({
    required List<SongParseMr> songParseMrList,
  }) = _SongParseMrList;

  factory SongParseMrList.fromJson(Map<String, dynamic> json) =>
      _$SongParseMrListFromJson(json);
}
