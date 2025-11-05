import 'package:new_cognisong/domain/entities/error_message.dart';
import 'package:new_cognisong/domain/entities/token.dart';
import 'package:new_cognisong/domain/entities/user.dart';
import 'package:new_cognisong/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserLoginUseCase {
  final UserRepository userRepository;

  UserLoginUseCase(this.userRepository);

  Future<Either<ErrorMessage?, Token?>> execute(Login login) async {
    return await userRepository.login(login);
  }
}
