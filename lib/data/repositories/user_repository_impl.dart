import 'package:new_cognisong/data/datasources/painting_level_datasource.dart';
import 'package:new_cognisong/data/datasources/painting_lyric_datasource.dart';
import 'package:new_cognisong/data/datasources/song_level_datasource.dart';
import 'package:new_cognisong/data/datasources/song_lyric_datasource.dart';
import 'package:new_cognisong/data/datasources/user_api_client.dart';
import 'package:new_cognisong/data/models/user/user_request.dart';
import 'package:new_cognisong/domain/entities/error_message.dart';
import 'package:new_cognisong/domain/entities/module.dart';
import 'package:new_cognisong/domain/entities/song_level_info.dart';
import 'package:new_cognisong/domain/entities/song_lyric_info.dart';
import 'package:new_cognisong/domain/entities/token.dart';
import 'package:new_cognisong/domain/entities/user.dart';
import 'package:new_cognisong/domain/entities/user_song_first_completed.dart';
import 'package:new_cognisong/domain/entities/user_stat.dart';
import 'package:new_cognisong/domain/repositories/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApiClient _userApiClient;

  UserRepositoryImpl(this._userApiClient);

  @override
  Future<Either<ErrorMessage?, Token?>> login(Login login) async {
    final userLoginRequest = UserLoginRequest(
      code: login.code,
      token: login.token,
    );

    try {
      final userResponse = await _userApiClient.login(userLoginRequest);
      if (userResponse.response.statusCode == 200) {
        return Right(Token.fromJson(userResponse.data));
      }
      return const Right(null);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return Left(ErrorMessage.fromJson(e.response?.data));
      }
    }
    return const Left(null);
  }

  @override
  Future<UserStat?> getUserStat() async {
    try {
      final userStatResponse = await _userApiClient.getUserStat();

      if (userStatResponse.response.statusCode == 200) {
        return UserStat.fromJson(userStatResponse.data);
      }
      return null;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return null;
      }
    }
    return null;
  }

  @override
  Future<UserStat?> putUserStat(UpdateUserStat updateUserStat) async {
    try {
      final userStatResponse = await _userApiClient.putUserStat(
        updateUserStat.toJson(),
      );

      if (userStatResponse.response.statusCode == 200) {
        return UserStat.fromJson(userStatResponse.data);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return null;
      }
    }
    return null;
  }

  @override
  Future<UserSongFirstCompleted?> getUserSongFirstCompleted() async {
    try {
      final userSongFirstCompleted = await _userApiClient
          .getUserSongFirstCompleted();

      if (userSongFirstCompleted.response.statusCode == 200) {
        return UserSongFirstCompleted.fromJson(userSongFirstCompleted.data);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return null;
      }
    }
    return null;
  }

  @override
  Future<SongLyricInfo?> getSongLyricInfo(int song, Module module) async {
    return module == Module.A
        ? songInfoDataSource[song]
        : paintingInfoDataSource[song];
  }

  @override
  Future<SongLevelInfo?> getSongLevelInfo(int level, Module module) async {
    return module == Module.A
        ? songLevelDataSource[level]
        : paintingLevelDataSource[level];
  }

  @override
  Future<User?> getUser() async {
    try {
      final userResponse = await _userApiClient.getUser();

      if (userResponse.response.statusCode == 200) {
        return User.fromJson(userResponse.data);
      }
      return null;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return null;
      }
    }
    return null;
  }

  @override
  Future<void> logOutUser(String token) async {
    try {
      await _userApiClient.logOutUser({'token': token});
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return;
      }
    }
  }
}
