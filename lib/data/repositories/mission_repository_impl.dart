import 'dart:io';

import 'package:new_cognisong/data/datasources/mission_api_client.dart';
import 'package:new_cognisong/domain/entities/mission.dart';
import 'package:new_cognisong/domain/entities/mission_audio.dart';
import 'package:new_cognisong/domain/entities/mission_picture.dart';
import 'package:new_cognisong/domain/entities/mission_submit.dart';
import 'package:new_cognisong/domain/repositories/mission_repository.dart';
import 'package:dio/dio.dart';

class MissionRepositoryImpl implements MissionRepository {
  final MissionApiClient _missionApiClient;
  MissionRepositoryImpl(this._missionApiClient);

  @override
  Future<MissionAudio?> postMissionAudio(File file) async {
    try {
      final missionResponse = await _missionApiClient.saveAudio(file);
      if (missionResponse.response.statusCode == 200) {
        return MissionAudio.fromJson(missionResponse.data);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return null;
      }
    }
    return null;
  }

  @override
  Future<MissionSubmitResponse?> postMissionSubmit(
    MissionSubmit missionSubmit,
  ) async {
    try {
      final missionResponse = await _missionApiClient.submitMission(
        missionSubmit.toJson(),
      );
      if (missionResponse.response.statusCode == 200) {
        return MissionSubmitResponse.fromJson(missionResponse.data);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return null;
      }
    }
    return null;
  }

  @override
  Future<MissionPicture?> postMissionPicture(File file, String url) async {
    try {
      final missionResponse = await _missionApiClient.savePicture(file, url);
      if (missionResponse.response.statusCode == 200) {
        return MissionPicture.fromJson(missionResponse.data);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return null;
      }
    }
    return null;
  }

  @override
  Future<Mission?> getMission() async {
    try {
      final missionResponse = await _missionApiClient.getMission();
      if (missionResponse.response.statusCode == 200) {
        return Mission.fromJson(missionResponse.data);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return null;
      }
    }
    return null;
  }
}
