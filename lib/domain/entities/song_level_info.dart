import 'package:freezed_annotation/freezed_annotation.dart';

part 'song_level_info.freezed.dart';
part 'song_level_info.g.dart';

@freezed
class SongLevelInfo with _$SongLevelInfo {
  factory SongLevelInfo({
    required int count,
    required bool isInitConsonant,
  }) = _SongLevelInfo;

  factory SongLevelInfo.fromJson(Map<String, dynamic> json) =>
      _$SongLevelInfoFromJson(json);
}
