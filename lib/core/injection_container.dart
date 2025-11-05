import 'package:new_cognisong/core/constants/url.dart';
import 'package:new_cognisong/data/datasources/local_data_source.dart';
import 'package:new_cognisong/data/datasources/mission_api_client.dart';
import 'package:new_cognisong/data/datasources/song_api_client.dart';
import 'package:new_cognisong/data/datasources/user_api_client.dart';
import 'package:new_cognisong/data/mapper/user_login_mapper.dart';
import 'package:new_cognisong/data/repositories/mission_repository_impl.dart';
import 'package:new_cognisong/data/repositories/song_repository_impl.dart';
import 'package:new_cognisong/data/repositories/user_repository_impl.dart';
import 'package:new_cognisong/domain/repositories/mission_repository.dart';
import 'package:new_cognisong/domain/repositories/song_repository.dart';
import 'package:new_cognisong/domain/repositories/user_repository.dart';
import 'package:new_cognisong/domain/usecases/mission/get_mission_usecase.dart';
import 'package:new_cognisong/domain/usecases/mission/post_mission_audio_usecase.dart';
import 'package:new_cognisong/domain/usecases/mission/post_mission_picture_usecase.dart';
import 'package:new_cognisong/domain/usecases/mission/post_mission_submit_usecase.dart';
import 'package:new_cognisong/domain/usecases/song/get_song_mr_parse_list_usecase.dart';
import 'package:new_cognisong/domain/usecases/song/get_song_mr_parse_usecase.dart';
import 'package:new_cognisong/domain/usecases/song/get_song_parse_list_usecase.dart';
import 'package:new_cognisong/domain/usecases/song/get_song_parse_usecase.dart';
import 'package:new_cognisong/domain/usecases/song/get_song_usecase.dart';
import 'package:new_cognisong/domain/usecases/user/user_get_song_level_info_usecase.dart';
import 'package:new_cognisong/domain/usecases/user/user_get_song_lyric_info_usecase.dart';
import 'package:new_cognisong/domain/usecases/user/user_get_user_stat_usecase.dart';
import 'package:new_cognisong/domain/usecases/user/user_get_user_usecase.dart';
import 'package:new_cognisong/domain/usecases/user/user_login_usecase.dart';
import 'package:new_cognisong/domain/usecases/user/user_logout_usecase.dart';
import 'package:new_cognisong/domain/usecases/user/user_song_first_completed_usecase.dart';
import 'package:new_cognisong/domain/usecases/user/user_update_user_stat_usecase.dart';
import 'package:new_cognisong/utils/audio_service.dart';
import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

// Future<Dio> setupDio() async {
//   final dio = Dio();
//   final SharedPreferences prefs = await SharedPreferences.getInstance();

//   dio.interceptors.add(
//     InterceptorsWrapper(
//       onRequest: (options, handler) async {
//         final isExcluded = options.path.startsWith('/user/login');

//         if (!isExcluded && prefs.getString('code') != null) {
//           options.headers['Authorization'] =
//               "Bearer ${prefs.getString('code')}";
//         }

//         return handler.next(options);
//       },
//       onResponse: (response, handler) {
//         if (response.data is String) {
//           response.data = json.decode(response.data);
//         }
//         return handler.next(response);
//       },
//       onError: (error, handler) {
//         if (error.response?.statusCode == 505) {
//           // 세션 만료 처리
//           _showDialog("세션 만료", "자동으로 로그아웃 되었습니다. 다시 로그인 해주세요!");
//         }

//         //   // 다른 기기 접속 처리
//         //   _showDialog("로그아웃", "다른 기기가 접속했습니다. 재접속을 해주세요!");
//         // } else {
//         //   // 기타 오류 처리
//         //   _showDialog("오류", "요청 중 오류가 발생했습니다: ${error.message}");
//         // }

//         return handler.next(error);
//       },
//     ),
//   );

//   return dio;
// }

Future<void> setupLocator(Dio dio) async {
  final localDataSource = LocalDataSource();
  await localDataSource.initialize();

  // 데이터 소스
  getIt.registerSingleton<Dio>(dio);
  getIt.registerSingleton<LocalDataSource>(localDataSource);

  getIt.registerSingleton<AudioService>(AudioService());

  getIt.registerLazySingleton<UserApiClient>(
    () => UserApiClient(getIt<Dio>(), baseUrl: ApiEndPoint.baseURL),
  );
  getIt.registerLazySingleton<SongApiClient>(
    () => SongApiClient(getIt<Dio>(), baseUrl: ApiEndPoint.baseURL),
  );
  getIt.registerLazySingleton<MissionApiClient>(
    () => MissionApiClient(getIt<Dio>(), baseUrl: ApiEndPoint.baseURL),
  );
  getIt.registerLazySingleton<UserLoginMapper>(() => UserLoginMapper());

  //Repository
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(getIt<UserApiClient>()),
  );
  getIt.registerLazySingleton<SongRepository>(
    () => SongRepositoryImpl(getIt<SongApiClient>()),
  );
  getIt.registerLazySingleton<MissionRepository>(
    () => MissionRepositoryImpl(getIt<MissionApiClient>()),
  );

  //Mission usecase
  getIt.registerFactory<PostMissionAudioUsecase>(
    () => PostMissionAudioUsecase(getIt<MissionRepository>()),
  );
  getIt.registerFactory<PostMissionSubmitUsecase>(
    () => PostMissionSubmitUsecase(getIt<MissionRepository>()),
  );
  getIt.registerFactory<PostMissionPictureUsecase>(
    () => PostMissionPictureUsecase(getIt<MissionRepository>()),
  );
  getIt.registerFactory<GetMissionUseCase>(
    () => GetMissionUseCase(getIt<MissionRepository>()),
  );

  //Song usecase
  getIt.registerFactory<GetSongUseCase>(
    () => GetSongUseCase(getIt<SongRepository>()),
  );
  getIt.registerFactory<GetSongParseUseCase>(
    () => GetSongParseUseCase(getIt<SongRepository>()),
  );
  getIt.registerFactory<GetSongMrParseUseCase>(
    () => GetSongMrParseUseCase(getIt<SongRepository>()),
  );
  getIt.registerFactory<GetSongMrParseListUsecase>(
    () => GetSongMrParseListUsecase(getIt<SongRepository>()),
  );
  getIt.registerFactory<GetSongParseListUsecase>(
    () => GetSongParseListUsecase(getIt<SongRepository>()),
  );

  //User usecase
  getIt.registerFactory<UserLoginUseCase>(
    () => UserLoginUseCase(getIt<UserRepository>()),
  );
  getIt.registerFactory<UserLogoutUsecase>(
    () => UserLogoutUsecase(getIt<UserRepository>()),
  );
  getIt.registerFactory<UserGetUserStatUseCase>(
    () => UserGetUserStatUseCase(getIt<UserRepository>()),
  );
  getIt.registerFactory<UserGetUserUseCase>(
    () => UserGetUserUseCase(getIt<UserRepository>()),
  );
  getIt.registerFactory<UserSongFirstCompletedUseCase>(
    () => UserSongFirstCompletedUseCase(getIt<UserRepository>()),
  );
  getIt.registerFactory<UserGetSongLyricInfoUseCase>(
    () => UserGetSongLyricInfoUseCase(getIt<UserRepository>()),
  );
  getIt.registerFactory<UserGetSongLevelInfoUseCase>(
    () => UserGetSongLevelInfoUseCase(getIt<UserRepository>()),
  );
  getIt.registerFactory<UserUpdateUserStatUsecase>(
    () => UserUpdateUserStatUsecase(getIt<UserRepository>()),
  );
}
