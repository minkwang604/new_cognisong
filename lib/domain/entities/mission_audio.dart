import 'package:freezed_annotation/freezed_annotation.dart';

part 'mission_audio.freezed.dart';
part 'mission_audio.g.dart';

@freezed
class MissionAudio with _$MissionAudio {
  factory MissionAudio({
    @JsonKey(name: 'audio_text') required String audioText,
  }) = _MissionAudio;

  factory MissionAudio.fromJson(Map<String, dynamic> json) =>
      _$MissionAudioFromJson(json);
}
