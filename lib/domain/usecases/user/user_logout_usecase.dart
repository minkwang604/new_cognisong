import 'package:new_cognisong/domain/repositories/user_repository.dart';

class UserLogoutUsecase {
  final UserRepository userRepository;

  UserLogoutUsecase(this.userRepository);

  Future<void> execute(String token) async {
    return await userRepository.logOutUser(token);
  }
}
