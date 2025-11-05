// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MissionImpl _$$MissionImplFromJson(Map<String, dynamic> json) =>
    _$MissionImpl(
      module: json['module'] as String,
      song: json['song'] as int,
      isFirstMissionCompleted: json['is_first_Mission_Completed'] as bool,
      isUser: json['is_user'] as bool,
      lastOrder: json['last_order'] as int,
    );

Map<String, dynamic> _$$MissionImplToJson(_$MissionImpl instance) =>
    <String, dynamic>{
      'module': instance.module,
      'song': instance.song,
      'is_first_Mission_Completed': instance.isFirstMissionCompleted,
      'is_user': instance.isUser,
      'last_order': instance.lastOrder,
    };
