import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'mission_api_client.g.dart';

@RestApi()
abstract class MissionApiClient {
  factory MissionApiClient(Dio dio, {String baseUrl}) = _MissionApiClient;

  @POST('/mission/audio')
  @MultiPart()
  Future<HttpResponse> saveAudio(@Part() File file);

  @POST('/mission')
  Future<HttpResponse> submitMission(
    @Body() Map<String, dynamic> missionSubmit,
  );

  @POST('/mission/picture')
  @MultiPart()
  Future<HttpResponse> savePicture(
    @Part() File file,
    @Part() String url,
  );

  @GET("/mission")
  Future<HttpResponse> getMission();
}
