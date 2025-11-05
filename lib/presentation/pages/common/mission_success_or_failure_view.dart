// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:new_cognisong/core/layouts/orientation_layout.dart';

class MissionSuccessOrFailure extends StatelessWidget {
  const MissionSuccessOrFailure({
    Key? key,
    required this.appBarWidget,
    required this.url,
    required this.lines,
    required this.color,
  }) : super(key: key);

  final Widget appBarWidget;
  final String url;
  final List<List<Offset>> lines;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return OrientationLayout(
      isRequiredPortrait: false,
      customContent: (context) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xffe7e7e7),
            toolbarHeight: 60,
            title: appBarWidget,
          ),
          body: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width * 0.43,
                      height: 52,
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          '직접 그린 그림',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      height: MediaQuery.of(context).size.height * 0.45,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                      ),
                      child: CustomPaint(
                        size: Size(
                          MediaQuery.of(context).size.width * 0.43,
                          MediaQuery.of(context).size.height * 0.45,
                        ),
                        painter: DrawingPainter(lines),
                      ),

                      // BlocBuilder<ModuleTutorialBloc,
                      //     ModuleTutorialState>(builder: (context, state) {
                      //   if (state is ModuleTutorialLoadState) {
                      //     return Stack(
                      //       children: [
                      //         Positioned.fill(
                      //           child: CustomPaint(
                      //             size: const Size(200, 200),
                      //             painter: DrawingPainter(
                      //                 state.moduleTutorialCommon.lines),
                      //           ),
                      //         ),
                      //       ],
                      //     );
                      //   }
                      //   return const Center(
                      //     child: Text("왼쪽"),
                      //   );
                      // }),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width * 0.43,
                      height: 52,
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          '정답 그림',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      height: MediaQuery.of(context).size.height * 0.45,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                      ),
                      child: Center(child: Image.asset(url)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
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
