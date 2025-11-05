// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_submit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MissionSubmitImpl _$$MissionSubmitImplFromJson(Map<String, dynamic> json) =>
    _$MissionSubmitImpl(
      type: json['type'] as String? ?? 'pre',
      missionWord: Map<String, String>.from(json['mission_word'] as Map),
      song: json['song'] as int,
      audioText: json['audio_text'] as String?,
      pictureScore: (json['picture_score'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as num),
      ),
      createdAt: DateTime.parse(json['created_at'] as String),
      order: json['order'] as int,
      isTest: json['is_test'] as bool?,
    );

Map<String, dynamic> _$$MissionSubmitImplToJson(_$MissionSubmitImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'mission_word': instance.missionWord,
      'song': instance.song,
      'audio_text': instance.audioText,
      'picture_score': instance.pictureScore,
      'created_at': instance.createdAt.toIso8601String(),
      'order': instance.order,
      'is_test': instance.isTest,
    };

_$MissionSubmitResponseImpl _$$MissionSubmitResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MissionSubmitResponseImpl(
      score: json['score'] as num,
    );

Map<String, dynamic> _$$MissionSubmitResponseImplToJson(
        _$MissionSubmitResponseImpl instance) =>
    <String, dynamic>{
      'score': instance.score,
    };
