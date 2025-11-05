import 'package:new_cognisong/core/layouts/orientation_layout.dart';
import 'package:flutter/material.dart';

class MissionCommonGuideView extends StatelessWidget {
  const MissionCommonGuideView({super.key, required this.text, this.color});

  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return OrientationLayout(
      customContent: (context) {
        return Scaffold(
          backgroundColor: color ?? Theme.of(context).primaryColor,
          appBar: AppBar(elevation: 0.0, toolbarHeight: 0),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/check.png', width: 40, height: 40),
                const SizedBox(height: 16),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      isRequiredPortrait: false,
    );
  }
}
