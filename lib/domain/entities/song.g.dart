// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SongImpl _$$SongImplFromJson(Map<String, dynamic> json) => _$SongImpl(
      id: json['id'] as int,
      url: json['url'] as String,
      vttUrl: json['vtt_url'] as String,
      mrUrl: json['mr_url'] as String,
    );

Map<String, dynamic> _$$SongImplToJson(_$SongImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'vtt_url': instance.vttUrl,
      'mr_url': instance.mrUrl,
    };
