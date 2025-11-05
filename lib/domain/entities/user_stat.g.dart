// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_stat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserStatImpl _$$UserStatImplFromJson(Map<String, dynamic> json) =>
    _$UserStatImpl(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      level: json['level'] as int,
      song: json['song'] as int,
      preLevel: json['pre_level'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      isPracticed: json['is_practiced'] as bool,
    );

Map<String, dynamic> _$$UserStatImplToJson(_$UserStatImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'level': instance.level,
      'song': instance.song,
      'pre_level': instance.preLevel,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'is_practiced': instance.isPracticed,
    };

_$UpdateUserStatImpl _$$UpdateUserStatImplFromJson(Map<String, dynamic> json) =>
    _$UpdateUserStatImpl(
      song: json['song'] as int?,
      level: json['level'] as int?,
      preLevel: json['pre_level'] as bool?,
      isPracticed: json['is_practiced'] as bool?,
    );

Map<String, dynamic> _$$UpdateUserStatImplToJson(
        _$UpdateUserStatImpl instance) =>
    <String, dynamic>{
      'song': instance.song,
      'level': instance.level,
      'pre_level': instance.preLevel,
      'is_practiced': instance.isPracticed,
    };
