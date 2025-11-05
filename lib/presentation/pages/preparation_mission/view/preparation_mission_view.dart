// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:new_cognisong/presentation/blocs/preparation_mission/preparation_mission_bloc.dart';
import 'package:new_cognisong/presentation/pages/common/mission_common_view.dart';

bool isChoseong(String char) {
  int codeUnit = char.codeUnitAt(0);
  return codeUnit >= 0x1100 && codeUnit <= 0x1112;
}

class PreParationMissionView extends StatelessWidget {
  const PreParationMissionView({
    Key? key,
    required this.order,
    required this.color,
  }) : super(key: key);

  final int order;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreParationMissionBloc, PreParationMissionState>(
      builder: (context, state) {
        final nowState = state as PreParationMissionLoadedState;
        return MissionCommonView(
          missionWidgetColor: color,
          order: order,
          title: nowState.title,
          mission: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: nowState.countDownValue > 0
                        ? Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '${nowState.countDownValue}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(width: 30, height: 30),
                  ),
                  SizedBox(
                    height: 40,
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            for (
                              int i = 0;
                              i < nowState.lyricEntries.length;
                              i++
                            )
                              nowState.lyricEntries[i].value.isMission
                                  ? TextSpan(
                                      children: List<InlineSpan>.generate(
                                        nowState
                                                .lyricEntries[i]
                                                .value
                                                .lyric
                                                .length +
                                            1,
                                        (idx) {
                                          if (idx ==
                                              nowState
                                                  .lyricEntries[i]
                                                  .value
                                                  .lyric
                                                  .length) {
                                            return const WidgetSpan(
                                              child: Text('  '),
                                            );
                                          }
                                          final text =
                                              nowState
                                                      .lyricEntries[i]
                                                      .value
                                                      .lyric[idx] ==
                                                  '_'
                                              ? '   '
                                              : nowState
                                                    .lyricEntries[i]
                                                    .value
                                                    .lyric[idx];

                                          final isQuizWord =
                                              isChoseong(
                                                nowState
                                                    .lyricEntries[i]
                                                    .value
                                                    .lyric[idx],
                                              ) ||
                                              nowState
                                                      .lyricEntries[i]
                                                      .value
                                                      .lyric[idx] ==
                                                  '_';
                                          return WidgetSpan(
                                            child: Center(
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                  top: isQuizWord ? 6.0 : 0.0,
                                                ),
                                                margin: EdgeInsets.symmetric(
                                                  horizontal: isQuizWord
                                                      ? 2.0
                                                      : 0.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                        Radius.circular(3.0),
                                                      ),
                                                  border: isQuizWord
                                                      ? i ==
                                                                nowState
                                                                    .lyricPositionIndex
                                                            ? Border.all(
                                                                color: color,
                                                              )
                                                            : null
                                                      : null,
                                                  color: isQuizWord
                                                      ? i <=
                                                                nowState
                                                                    .lyricPositionIndex
                                                            ? color.withOpacity(
                                                                0.1,
                                                              )
                                                            : Colors
                                                                  .grey
                                                                  .shade300
                                                      : null,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: isQuizWord
                                                        ? 4.0
                                                        : 0.0,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      text,
                                                      style: TextStyle(
                                                        fontSize: 28,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            i <=
                                                                nowState
                                                                    .lyricPositionIndex
                                                            ? color
                                                            : Colors.black,
                                                        height: 1.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  : WidgetSpan(
                                      child: SizedBox(
                                        child: Center(
                                          child: Text(
                                            '${nowState.lyricEntries[i].value.lyric} ',
                                            style: TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  i <=
                                                      nowState
                                                          .lyricPositionIndex
                                                  ? color
                                                  : Colors.black,
                                              height: 1.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              IconButton(
                iconSize: 50,
                icon: nowState.isAudioStart
                    ? Icon(Icons.pause_circle, color: color)
                    : Icon(Icons.play_circle, color: color),
                onPressed: () {
                  context.read<PreParationMissionBloc>().add(
                    AudioAndRecordChangeStatePreParationMissionEvent(),
                  );
                },
              ),
            ],
          ),
          appBarTitle: '소절 진행 상황',
          value: nowState.totalPosition == const Duration()
              ? 0
              : (nowState.currentPosition.inMilliseconds /
                    nowState.totalPosition.inMilliseconds),
        );
      },
    );
  }
}
