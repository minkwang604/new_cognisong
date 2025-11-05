// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_parse_mr.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SongParseMrImpl _$$SongParseMrImplFromJson(Map<String, dynamic> json) =>
    _$SongParseMrImpl(
      id: json['id'] as int,
      step: json['step'] as int,
      songId: json['song_id'] as int,
      mrUrl: json['mr_url'] as String,
      vttUrl: json['vtt_url'] as String,
    );

Map<String, dynamic> _$$SongParseMrImplToJson(_$SongParseMrImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'step': instance.step,
      'song_id': instance.songId,
      'mr_url': instance.mrUrl,
      'vtt_url': instance.vttUrl,
    };

_$SongParseMrListImpl _$$SongParseMrListImplFromJson(
        Map<String, dynamic> json) =>
    _$SongParseMrListImpl(
      songParseMrList: (json['songParseMrList'] as List<dynamic>)
          .map((e) => SongParseMr.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SongParseMrListImplToJson(
        _$SongParseMrListImpl instance) =>
    <String, dynamic>{
      'songParseMrList': instance.songParseMrList,
    };
