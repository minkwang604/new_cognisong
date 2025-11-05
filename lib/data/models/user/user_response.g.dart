// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserLoginResponseImpl _$$UserLoginResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UserLoginResponseImpl(
      id: json['id'] as int,
      code: json['code'] as String,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
    );

Map<String, dynamic> _$$UserLoginResponseImplToJson(
        _$UserLoginResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
