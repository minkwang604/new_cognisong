import 'package:new_cognisong/presentation/blocs/preparation_mission/preparation_mission_bloc.dart';
import 'package:new_cognisong/presentation/pages/common/mission_common_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreParationMissionResultView extends StatelessWidget {
  const PreParationMissionResultView({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreParationMissionBloc, PreParationMissionState>(
      builder: (context, state) {
        final nowState = state as PreParationMissionResultState;
        return MissionCommonView(
          missionWidgetColor: color,
          mission: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    for (int i = 0; i < nowState.lyricEntries.length; i++)
                      nowState.lyricsLines.contains(
                            nowState.lyricEntries[i].value.line,
                          )
                          ? i == nowState.lyricEntries.length - 1
                                ? TextSpan(
                                    children: _buildTextSpans(
                                      nowState.lyricEntries[i].value.lyric,
                                      true,
                                      i <= nowState.lyricPositionIndex
                                          ? color
                                          : Colors.black,
                                    ),
                                  )
                                : TextSpan(
                                    children: _buildTextSpans(
                                      nowState.lyricEntries[i].value.lyric,
                                      nowState.lyricEntries[i].value.line ==
                                          nowState
                                              .lyricEntries[i + 1]
                                              .value
                                              .line,
                                      i <= nowState.lyricPositionIndex
                                          ? color
                                          : Colors.black,
                                    ),
                                  )
                          : const TextSpan(text: ''),
                  ],
                ),
              ),
            ],
          ),
          appBarTitle: '정답을 확인해볼까요?',
          value: nowState.totalPosition == const Duration()
              ? 0
              : (nowState.currentPosition.inMilliseconds /
                    nowState.totalPosition.inMilliseconds),
          title: '문제를 확인해보세요!',
        );
      },
    );
  }
}

List<InlineSpan> _buildTextSpans(String lyric, bool check, Color color) {
  List<InlineSpan> textSpans = [];
  List<String> words = lyric
      .split("_")
      .where((part) => part.isNotEmpty)
      .toList();

  List<bool> wordsChecking = words
      .map((value) => lyric.contains('_${value}_'))
      .toList();

  for (int i = 0; i < words.length; i++) {
    String part = words[i];
    bool partChecking = wordsChecking[i];
    if (partChecking) {
      String changeWord = part.replaceAll('_', '');
      // String word = part.substring(2, part.length - 2);
      textSpans.add(
        TextSpan(
          text: changeWord,
          style: TextStyle(
            color: color,
            backgroundColor: Colors.green.shade100,
            fontSize: 28,
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
        ),
      );
      words.length == 1
          ? check
                ? textSpans.add(const TextSpan(text: ' '))
                : textSpans.add(const TextSpan(text: '\n'))
          : null;
    } else {
      textSpans.add(
        TextSpan(
          text: part,
          style: TextStyle(
            color: color,
            fontSize: 28,
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
        ),
      );
    }
  }
  check
      ? textSpans.add(const TextSpan(text: ' '))
      : textSpans.add(const TextSpan(text: '\n'));
  return textSpans;
}
