import 'package:new_cognisong/domain/entities/user_stat.dart';
import 'package:new_cognisong/domain/repositories/user_repository.dart';

class UserGetUserStatUseCase {
  final UserRepository userRepository;

  UserGetUserStatUseCase(this.userRepository);

  Future<UserStat?> execute() async {
    return await userRepository.getUserStat();
  }
}
