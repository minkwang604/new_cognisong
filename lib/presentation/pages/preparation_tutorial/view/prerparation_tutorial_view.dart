import 'package:new_cognisong/presentation/blocs/preparation_tutorial/preparation_tutorial_bloc.dart';
import 'package:new_cognisong/presentation/pages/common/mission_common_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreParationTutorialView extends StatelessWidget {
  const PreParationTutorialView({super.key, required this.primaryColor});

  final Color primaryColor;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreParationTutorialBloc, PreParationTutorialState>(
      builder: (context, state) {
        final nowState = state as PreParationTutorialLoadedState;
        return MissionCommonView(
          missionWidgetColor: primaryColor,
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
                              color: primaryColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '${nowState.countDownValue}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
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
                              nowState.lyricEntries[i].value.line ==
                                          nowState.lyricsLine ||
                                      (nowState.step != 1 && nowState.step != 3)
                                  ? WidgetSpan(
                                      child: Text(
                                        '${nowState.lyricEntries[i].value.lyric} ',
                                        style: TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              i <= nowState.lyricPositionIndex
                                              ? primaryColor
                                              : Colors.black,
                                          height: 1.0,
                                        ),
                                      ),
                                    )
                                  : WidgetSpan(child: Container()),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              IconButton(
                iconSize: 50,
                onPressed: () {
                  context.read<PreParationTutorialBloc>().add(
                    PauseAndResumeClickPreParationTutorialEvent(),
                  );
                },
                icon: nowState.isAudioStart
                    ? Icon(Icons.pause_circle, color: primaryColor)
                    : Icon(Icons.play_circle, color: primaryColor),
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
