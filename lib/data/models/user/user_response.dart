import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response.freezed.dart';
part 'user_response.g.dart';

@freezed
class UserLoginResponse with _$UserLoginResponse {
  factory UserLoginResponse({
    // required Status status,
    // required String message,
    required int id,
    required String code,
    required String created_at,
    required String updated_at,
  }) = _UserLoginResponse;

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$UserLoginResponseFromJson(json);
}

// @freezed
// class UserProfileResponse with _$UserProfileResponse {
//   factory UserProfileResponse({
//     @JsonKey(name: 'ID') required int id,
//     @JsonKey(name: 'Email') required String email,
//     @JsonKey(name: 'Password') required String password,
//     @JsonKey(name: 'Age') required int age,
//     @JsonKey(name: 'Education') required String education,
//     @JsonKey(name: 'Photo') required String? photo,
//   }) = _UserProfileResponse;

//   factory UserProfileResponse.fromJson(Map<String, dynamic> json) =>
//       _$UserProfileResponseFromJson(json);
// }
