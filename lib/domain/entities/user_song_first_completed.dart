import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_song_first_completed.freezed.dart';
part 'user_song_first_completed.g.dart';

@freezed
class UserSongFirstCompleted with _$UserSongFirstCompleted {
  factory UserSongFirstCompleted({
    @JsonKey(name: 'is_first_Mission_Completed')
    required bool isFirstMissionCompleted,
  }) = _UserSongFirstCompleted;

  factory UserSongFirstCompleted.fromJson(Map<String, dynamic> json) =>
      _$UserSongFirstCompletedFromJson(json);
}
