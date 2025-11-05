import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'song_api_client.g.dart';

@RestApi()
abstract class SongApiClient {
  factory SongApiClient(Dio dio, {String baseUrl}) = _SongApiClient;

  @GET('/song')
  Future<HttpResponse> getSong(@Query('song_id') int? songId);

  @GET('/song/parse')
  Future<HttpResponse> getSongParse(@Query('step') int step);

  @GET('/song/parse/list')
  Future<HttpResponse> getSongParseList(@Query('song_id') int? songId);

  @GET('/song/mr')
  Future<HttpResponse> getSongParseMr(@Query('step') int step);

  @GET('/song/mr/list')
  Future<HttpResponse> getSongParseMrList(@Query('song_id') int? songId);
}
