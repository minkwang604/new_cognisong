import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_stat.freezed.dart';
part 'user_stat.g.dart';

@freezed
class UserStat with _$UserStat {
  factory UserStat({
    required int id,
    @JsonKey(name: "user_id") required int userId,
    required int level,
    required int song,
    @JsonKey(name: "pre_level") required bool preLevel,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'is_practiced') required bool isPracticed,
  }) = _UserStat;

  factory UserStat.fromJson(Map<String, dynamic> json) =>
      _$UserStatFromJson(json);
}

@freezed
class UpdateUserStat with _$UpdateUserStat {
  factory UpdateUserStat({
    int? song,
    int? level,
    @JsonKey(name: "pre_level") bool? preLevel,
    @JsonKey(name: 'is_practiced') bool? isPracticed,
  }) = _UpdateUserStat;

  factory UpdateUserStat.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserStatFromJson(json);
}
