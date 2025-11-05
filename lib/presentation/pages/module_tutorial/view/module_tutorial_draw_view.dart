import 'package:new_cognisong/domain/entities/module.dart';
import 'package:new_cognisong/presentation/blocs/module_tutorial/module_tutorial_bloc.dart';
import 'package:new_cognisong/presentation/pages/common/mission_common_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModuleTutorialDrawView extends StatelessWidget {
  const ModuleTutorialDrawView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModuleTutorialBloc, ModuleTutorialState>(
      builder: (context, state) {
        final nowState = state as ModuleTutorialLoadedState;
        return MissionCommonView(
          module: Module.B,
          title: '${nowState.wordStep}) 에 들어가는 그림을 그려보세요!',
          mission: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: 52,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '${nowState.wordStep})에 들어가는 그림을 그려보세요!',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    nowState.isDrawStart
                        ? Positioned.fill(
                            child: CustomPaint(
                              painter: DrawingPainter(nowState.lines),
                            ),
                          )
                        : Container(),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onPanStart: (s) {
                        if (nowState.isDrawStart) {
                          final maxWidth =
                              MediaQuery.of(context).size.width * 0.75;
                          final maxHeight =
                              MediaQuery.of(context).size.height - 112;
                          final localPosition = s.localPosition;

                          if (localPosition.dx > 0 &&
                              localPosition.dx < maxWidth &&
                              localPosition.dy > 0 &&
                              localPosition.dy < maxHeight) {
                            final relativeOffset = Offset(
                              localPosition.dx / maxWidth,
                              localPosition.dy / maxHeight,
                            );

                            context.read<ModuleTutorialBloc>().add(
                              StartDrawModuleTutorialEvent(
                                offset: relativeOffset,
                              ),
                            );
                          }
                        }
                      },
                      onPanUpdate: (s) {
                        if (nowState.isDrawStart) {
                          final maxWidth =
                              MediaQuery.of(context).size.width * 0.75;
                          final maxHeight =
                              MediaQuery.of(context).size.height - 112;
                          final localPosition = s.localPosition;

                          if (localPosition.dx > 0 &&
                              localPosition.dx < maxWidth &&
                              localPosition.dy > 0 &&
                              localPosition.dy < maxHeight) {
                            final relativeOffset = Offset(
                              localPosition.dx / maxWidth,
                              localPosition.dy / maxHeight,
                            );

                            context.read<ModuleTutorialBloc>().add(
                              DrawingDrawModuleTutorialEvent(
                                offset: relativeOffset,
                              ),
                            );
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          appBarTitle: 'null',
          appBarWidget: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      for (int i = 0; i < nowState.lyricEntries.length; i++)
                        WidgetSpan(
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Text.rich(
                                TextSpan(
                                  children: _buildTextSpans(
                                    nowState.lyricEntries[i].value.lyric,
                                  ),
                                ),
                                // TextSpan(children: [
                                //   WidgetSpan(
                                //     child: Container(
                                //       decoration: BoxDecoration(
                                //         borderRadius:
                                //             BorderRadius.all(Radius.circular(5.0)),
                                //         color:
                                //             nowState.lyricEntries[i].value.isMission
                                //                 ? Colors.green.shade100
                                //                 : null,
                                //       ),
                                //       child: Padding(
                                //         padding: EdgeInsets.symmetric(
                                //             vertical: 4.0, horizontal: 6.0),
                                //         child: Text(
                                //           nowState.lyricEntries[i].value.lyric,
                                //           style: TextStyle(
                                //               fontSize: 23,
                                //               fontWeight: FontWeight.w600,
                                //               color: i <= nowState.lyricPositionIndex
                                //                   ? Theme.of(context).primaryColor
                                //                   : Colors.black,
                                //               height: 1.0),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ]),
                              ),
                              Positioned(
                                top: -7,
                                left: -7,
                                child: nowState.lyricEntries[i].value.isMission
                                    ? Container(
                                        width: 15,
                                        height: 15,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${nowState.lyricEntries[i].value.idx}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          value: 0,
          leftButton: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Theme.of(context).primaryColor),
            ),
            onPressed: () {
              context.read<ModuleTutorialBloc>().add(
                RemoveDrawModuleTutorialEvent(),
              );
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.10,
              height: 30,
              child: const Center(
                child: Text(
                  '새로고침',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          rightButton: nowState.canClickFinish
              ? Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    onPressed: () {
                      context.read<ModuleTutorialBloc>().add(
                        CompleteDrawModuleTutorialEvent(),
                      );
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.12,
                      height: 30,
                      child: const Center(
                        child: Text(
                          '완료',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.12,
                    height: 30,
                    child: const Text(''),
                  ),
                ),
        );
      },
    );
  }
}

List<InlineSpan> _buildTextSpans(String lyric) {
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
        WidgetSpan(
          child: Container(
            padding: const EdgeInsets.only(top: 6.0),
            margin: const EdgeInsets.symmetric(horizontal: 1.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1.0),
              child: Text(
                words.length == 1 ? '$changeWord ' : changeWord,
                style: TextStyle(
                  color: Colors.black,
                  backgroundColor: Colors.green.shade100,
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  height: 1.0,
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      textSpans.add(
        WidgetSpan(
          child: Container(
            padding: const EdgeInsets.only(top: 6.0),
            child: Text(
              '$part ',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 23,
                fontWeight: FontWeight.w600,
                height: 1.0,
              ),
            ),
          ),
        ),
      );
    }
  }

  return textSpans;
}

class DrawingPainter extends CustomPainter {
  DrawingPainter(this.lines);
  final List<List<Offset>> lines;

  @override
  void paint(Canvas canvas, Size size) {
    for (var oneLine in lines) {
      var l = <Offset>[];
      var p = Path();
      for (var oneDot in oneLine) {
        var dx = oneDot.dx * size.width;
        var dy = oneDot.dy * size.height;
        var relativeDot = Offset(dx, dy);
        l.add(relativeDot);
        p.addPolygon(l, false);
      }
      canvas.drawPath(
        p,
        Paint()
          ..color = Colors.black
          ..strokeWidth = 5
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke,
      );
    }
  }

  @override
  bool shouldRepaint(DrawingPainter oldDelegate) {
    return oldDelegate.lines != lines;
  }
}
