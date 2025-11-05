import 'package:new_cognisong/domain/entities/user_song_first_completed.dart';
import 'package:new_cognisong/domain/repositories/user_repository.dart';

class UserSongFirstCompletedUseCase {
  final UserRepository userRepository;

  UserSongFirstCompletedUseCase(this.userRepository);

  Future<UserSongFirstCompleted?> execute() async {
    return await userRepository.getUserSongFirstCompleted();
  }
}
