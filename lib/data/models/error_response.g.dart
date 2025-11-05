// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiErrorResponseImpl _$$ApiErrorResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ApiErrorResponseImpl(
      detail: ErrorDetail.fromJson(json['detail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ApiErrorResponseImplToJson(
        _$ApiErrorResponseImpl instance) =>
    <String, dynamic>{
      'detail': instance.detail,
    };

_$ErrorDetailImpl _$$ErrorDetailImplFromJson(Map<String, dynamic> json) =>
    _$ErrorDetailImpl(
      msg: json['msg'] as String,
    );

Map<String, dynamic> _$$ErrorDetailImplToJson(_$ErrorDetailImpl instance) =>
    <String, dynamic>{
      'msg': instance.msg,
    };
