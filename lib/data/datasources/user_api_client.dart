import 'package:new_cognisong/data/models/user/user_request.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'user_api_client.g.dart';

@RestApi()
abstract class UserApiClient {
  factory UserApiClient(Dio dio, {String baseUrl}) = _UserApiClient;

  @POST("/login")
  Future<HttpResponse> login(@Body() UserLoginRequest userLoginRequest);

  @GET("/user_stat")
  Future<HttpResponse> getUserStat();

  @GET('/user/song/first/completed')
  Future<HttpResponse> getUserSongFirstCompleted();

  @GET('/user')
  Future<HttpResponse> getUser();

  @PUT('/user_stat')
  Future<HttpResponse> putUserStat(@Body() Map<String, dynamic> updateUserStat);

  @POST("/logout")
  Future<HttpResponse> logOutUser(@Body() Map<String, dynamic> logoutUser);
}
