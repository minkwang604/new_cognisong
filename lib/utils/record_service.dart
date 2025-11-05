import 'dart:math';

import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:path/path.dart' as p;
import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';

class RecordService {
  late AudioRecorder _audioRecorder;

  RecordService() {
    _audioRecorder = AudioRecorder();
  }

  AudioRecorder get audioRecorder => _audioRecorder;

  Future<String> _getPath() async {
    final dir = await getApplicationDocumentsDirectory();
    return p.join(
      dir.path,
      'audio_${DateTime.now().millisecondsSinceEpoch}.mp4',
    );
  }

  Future<void> recordFile(AudioRecorder recorder, RecordConfig config) async {
    final path = await _getPath();
    await recorder.start(config, path: path);
  }

  Future<void> start() async {
    if (await _audioRecorder.hasPermission()) {
      const encoder = AudioEncoder.aacLc;
      const config = RecordConfig(
        encoder: encoder,
        numChannels: 1,
        autoGain: false,
      );
      await recordFile(_audioRecorder, config);
    }
  }

  Future<String?> stop({double volumeIncrease = 20.0}) async {
    final path = await _audioRecorder.stop();
    final audioNewPath = await _increaseVolume(path, volumeIncrease);
    return audioNewPath;

    // final path = await _audioRecorder.stop();
    // return path;
  }

  Future<String?> _increaseVolume(
    String? inputPath,
    double volumeIncrease,
  ) async {
    final dir = await getApplicationDocumentsDirectory();
    final outputPath = p.join(
      dir.path,
      'amplified_${p.basename(inputPath ?? '')}',
    );

    final volumeDb = 20 * log(volumeIncrease) / log(10);
    final command =
        '-i $inputPath -filter:a "volume=${volumeDb}dB" $outputPath';

    await FFmpegKit.execute(command);
    return outputPath;
  }

  Future<void> pause() => _audioRecorder.pause();
  Future<void> resume() => _audioRecorder.resume();
  Future<bool> isPlaying() => _audioRecorder.isRecording();
}
