import 'package:freezed_annotation/freezed_annotation.dart';

part 'mission.freezed.dart';
part 'mission.g.dart';

@freezed
class Mission with _$Mission {
  factory Mission({
    required String module,
    required int song,
    @JsonKey(name: 'is_first_Mission_Completed')
    required bool isFirstMissionCompleted,
    @JsonKey(name: 'is_user') required bool isUser,
    @JsonKey(name: 'last_order') required int lastOrder,
  }) = _Mission;

  factory Mission.fromJson(Map<String, dynamic> json) =>
      _$MissionFromJson(json);
}
