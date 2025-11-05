import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_response.freezed.dart';
part 'error_response.g.dart';

@freezed
class ApiErrorResponse with _$ApiErrorResponse {
  factory ApiErrorResponse({required ErrorDetail detail}) = _ApiErrorResponse;

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorResponseFromJson(json);
}

@freezed
class ErrorDetail with _$ErrorDetail {
  factory ErrorDetail({required String msg}) = _ErrorDetail;

  factory ErrorDetail.fromJson(Map<String, dynamic> json) =>
      _$ErrorDetailFromJson(json);
}
