import 'package:new_cognisong/domain/entities/error_message.dart';
import 'package:new_cognisong/domain/entities/module.dart';
import 'package:new_cognisong/domain/entities/song_level_info.dart';
import 'package:new_cognisong/domain/entities/song_lyric_info.dart';
import 'package:new_cognisong/domain/entities/token.dart';
import 'package:new_cognisong/domain/entities/user.dart';
import 'package:new_cognisong/domain/entities/user_song_first_completed.dart';
import 'package:new_cognisong/domain/entities/user_stat.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<ErrorMessage?, Token?>> login(Login login);
  Future<UserStat?> getUserStat();
  Future<UserSongFirstCompleted?> getUserSongFirstCompleted();
  Future<SongLyricInfo?> getSongLyricInfo(int song, Module module);
  Future<SongLevelInfo?> getSongLevelInfo(int level, Module module);
  Future<User?> getUser();
  Future<UserStat?> putUserStat(UpdateUserStat updateUserStat);
  Future<void> logOutUser(String token);
}
