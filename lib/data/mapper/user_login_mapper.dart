import 'package:new_cognisong/data/models/user/user_request.dart';

class UserLoginMapper {
  UserLoginRequest toUserLoginRequest(String code) {
    return UserLoginRequest(code: code);
  }
}
