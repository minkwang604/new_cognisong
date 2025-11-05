import 'package:freezed_annotation/freezed_annotation.dart';

part 'mission_submit.freezed.dart';
part 'mission_submit.g.dart';

@freezed
class MissionSubmit with _$MissionSubmit {
  factory MissionSubmit({
    @JsonKey(name: 'type') @Default('pre') String type,
    @JsonKey(name: 'mission_word') required Map<String, String> missionWord,
    required int song,
    @JsonKey(name: 'audio_text') String? audioText,
    @JsonKey(name: 'picture_score') Map<String, num>? pictureScore,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    required int order,
    @JsonKey(name: 'is_test') bool? isTest,
  }) = _MissionSubmit;

  factory MissionSubmit.fromJson(Map<String, dynamic> json) =>
      _$MissionSubmitFromJson(json);
}

@freezed
class MissionSubmitResponse with _$MissionSubmitResponse {
  factory MissionSubmitResponse({
    required num score,
  }) = _MissionSubmitResponse;

  factory MissionSubmitResponse.fromJson(Map<String, dynamic> json) =>
      _$MissionSubmitResponseFromJson(json);
}
