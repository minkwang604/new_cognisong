import 'package:freezed_annotation/freezed_annotation.dart';

part 'mission_picture.freezed.dart';
part 'mission_picture.g.dart';

@freezed
class MissionPicture with _$MissionPicture {
  factory MissionPicture({
    required num similarity,
  }) = _MissionPicture;

  factory MissionPicture.fromJson(Map<String, dynamic> json) =>
      _$MissionPictureFromJson(json);
}
