import 'package:new_cognisong/domain/entities/user_stat.dart';
import 'package:new_cognisong/domain/repositories/user_repository.dart';

class UserUpdateUserStatUsecase {
  final UserRepository userRepository;

  UserUpdateUserStatUsecase(this.userRepository);

  Future<UserStat?> execute(UpdateUserStat updateUserStat) async {
    return await userRepository.putUserStat(updateUserStat);
  }
}
