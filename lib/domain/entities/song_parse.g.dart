// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_parse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SongParseImpl _$$SongParseImplFromJson(Map<String, dynamic> json) =>
    _$SongParseImpl(
      id: json['id'] as int,
      songId: json['song_id'] as int,
      step: json['step'] as int,
      url: json['url'] as String,
      vttUrl: json['vtt_url'] as String,
    );

Map<String, dynamic> _$$SongParseImplToJson(_$SongParseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'song_id': instance.songId,
      'step': instance.step,
      'url': instance.url,
      'vtt_url': instance.vttUrl,
    };

_$SongParseListImpl _$$SongParseListImplFromJson(Map<String, dynamic> json) =>
    _$SongParseListImpl(
      songParseList: (json['songParseList'] as List<dynamic>)
          .map((e) => SongParse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SongParseListImplToJson(_$SongParseListImpl instance) =>
    <String, dynamic>{
      'songParseList': instance.songParseList,
    };
