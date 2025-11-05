class UserLoginRequest {
  final String code;
  String? token;
  UserLoginRequest({required this.code, this.token});

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'token': token,
    };
  }
}

class UserSignUpRequest {
  final String name;
  final int gender;
  final String birth;
  final String education;
  final String id;
  final String password;

  const UserSignUpRequest(this.name, this.gender, this.birth, this.education,
      this.id, this.password);
}
