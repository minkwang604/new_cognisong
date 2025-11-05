import 'dart:async';

import 'package:audioplayers/audioplayers.dart';

// import 'package:just_audio/just_audio.dart';
class AudioService {
  late AudioPlayer _audioPlayer;
  StreamSubscription<Duration>? _positionChangeSubscription;

  AudioService() {
    _audioPlayer = AudioPlayer();
  }

  AudioPlayer get audioPlayer => _audioPlayer;
  PlayerState get state => _audioPlayer.state;

  Future<bool> isPlaying() async {
    return _audioPlayer.state == PlayerState.playing;
  }

  Future<void> start(Source source) async {
    await _audioPlayer.play(source, volume: 0.5);
  }

  Future<Duration?> getDuration() async {
    return _audioPlayer.getDuration();
  }

  Future<void> startAndWait(Source source, {int second = 0}) async {
    try {
      await _audioPlayer.play(source);
    } catch (e) {
      print('$e');
    }

    await _audioPlayer.onPlayerStateChanged
        .firstWhere(((state) => state == PlayerState.completed));
    await Future.delayed(Duration(seconds: second));
  }

  Future<void> wait() async {
    await _audioPlayer.onPlayerStateChanged
        .firstWhere(((state) => state == PlayerState.completed));
  }

  void positionChangeEvent(Function(Duration)? event) async {
    _positionChangeSubscription = _audioPlayer.onPositionChanged.listen(event);
  }

  void stopChangEvent() async {
    _positionChangeSubscription?.cancel();
  }

  void pause() {
    _audioPlayer.pause();
  }

  void stop() {
    _audioPlayer.stop();
  }

  void resume() {
    _audioPlayer.resume();
  }

  void dispose() {
    _audioPlayer.dispose();
  }
}
