import 'package:new_cognisong/domain/entities/user.dart';
import 'package:new_cognisong/domain/repositories/user_repository.dart';

class UserGetUserUseCase {
  final UserRepository userRepository;

  UserGetUserUseCase(this.userRepository);

  Future<User?> execute() async {
    return await userRepository.getUser();
  }
}
