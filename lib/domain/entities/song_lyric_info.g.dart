// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_lyric_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SongLyricInfoImpl _$$SongLyricInfoImplFromJson(Map<String, dynamic> json) =>
    _$SongLyricInfoImpl(
      total: json['total'] as int,
      changeLyric: (json['changeLyric'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k), e as String),
      ),
    );

Map<String, dynamic> _$$SongLyricInfoImplToJson(_$SongLyricInfoImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'changeLyric':
          instance.changeLyric.map((k, e) => MapEntry(k.toString(), e)),
    };
