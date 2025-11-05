import 'package:freezed_annotation/freezed_annotation.dart';

part 'song.freezed.dart';
part 'song.g.dart';

@freezed
class Song with _$Song {
  factory Song({
    required int id,
    required String url,
    @JsonKey(name: "vtt_url") required String vttUrl,
    @JsonKey(name: 'mr_url') required String mrUrl,
  }) = _Song;

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);
}
