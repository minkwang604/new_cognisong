import 'package:new_cognisong/domain/entities/module.dart';
import 'package:new_cognisong/presentation/blocs/module_mission/module_mission_bloc.dart';
import 'package:new_cognisong/presentation/pages/common/mission_common_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModuleMissionView extends StatelessWidget {
  const ModuleMissionView({
    super.key,
    required this.order,
    required this.color,
  });

  final int order;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModuleMissionBloc, ModuleMissionState>(
      builder: (context, state) {
        final nowState = state as ModuleMissionLoadedState;
        return MissionCommonView(
          order: order,
          module: Module.B,
          title: '${nowState.wordStep})에 들어가는 그림을 그려보세요!',
          mission: nowState.isMissionLyric
              ? Column(
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

                                // MediaQuery.of(context).size.height - 78;
                                final localPosition = s.localPosition;

                                if (localPosition.dx > 0 &&
                                    localPosition.dx < maxWidth &&
                                    localPosition.dy > 0 &&
                                    localPosition.dy < maxHeight) {
                                  final relativeOffset = Offset(
                                    localPosition.dx / maxWidth,
                                    localPosition.dy / maxHeight,
                                  );

                                  context.read<ModuleMissionBloc>().add(
                                    StartDrawModuleMissionEvent(
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

                                  context.read<ModuleMissionBloc>().add(
                                    DrawingDrawModuleMissionEvent(
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
                )
              : const Center(child: Text('노래를 들어보세요')),
          appBarTitle: 'null',
          appBarWidget: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  textAlign: TextAlign.end,
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
                                    nowState.lyricEntries[i].value.idx,
                                    color,
                                    nowState.wordStep,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: -10,
                                left: -10,
                                child: nowState.lyricEntries[i].value.isMission
                                    ? Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                          color: color,
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
            style: OutlinedButton.styleFrom(side: BorderSide(color: color)),
            onPressed: () {
              context.read<ModuleMissionBloc>().add(
                RemoveDrawModuleMissionEvent(),
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
                      side: BorderSide(color: color),
                    ),
                    onPressed: () {
                      context.read<ModuleMissionBloc>().add(
                        CompleteDrawModuleMissionEvent(),
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

bool isChoseong(String char) {
  int codeUnit = char.codeUnitAt(0);
  return codeUnit >= 0x1100 && codeUnit <= 0x1112;
}

List<Color> colors = [
  Colors.pink.shade100,
  Colors.green.shade100,
  Colors.red.shade100,
  Colors.yellow.shade100,
];

List<InlineSpan> _buildTextSpans(
  String lyric,
  int wordIdx,
  Color color,
  int wordStep,
) {
  List<InlineSpan> widgetSpans = [];

  for (int t = 0; t < lyric.length; t++) {
    final isQuizWord = isChoseong(lyric[t]) || lyric[t] == '_';
    final changeLyric = lyric[t] == '_' ? '   ' : lyric[t];
    widgetSpans.add(
      WidgetSpan(
        child: Container(
          padding: EdgeInsets.only(top: isQuizWord ? 6.0 : 0.0),
          margin: EdgeInsets.symmetric(horizontal: isQuizWord ? 1.0 : 0.0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(3.0)),
            color: isQuizWord
                ? wordIdx == wordStep
                      ? color.withOpacity(0.3)
                      : Colors.grey
                : null,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: isQuizWord ? 4.0 : 0.0),
            child: Text(
              changeLyric,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                height: 1.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
  widgetSpans.add(const WidgetSpan(child: Text(' ')));

  return widgetSpans;
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
