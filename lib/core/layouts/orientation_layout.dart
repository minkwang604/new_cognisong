import 'package:new_cognisong/core/layouts/landscape_layout.dart';
import 'package:new_cognisong/core/layouts/portrait_layout.dart';
import 'package:flutter/material.dart';

class OrientationLayout extends StatelessWidget {
  final Widget Function(BuildContext) customContent;

  //
  final bool isRequiredPortrait;
  const OrientationLayout({
    Key? key,
    required this.customContent,
    required this.isRequiredPortrait,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (isRequiredPortrait) {
          if (orientation == Orientation.portrait) {
            return customContent(context);
          } else {
            return const LandscapeLayout();
          }
        } else {
          if (orientation == Orientation.portrait) {
            return const PortraitLayout();
          } else {
            return customContent(context);
          }
        }
      },
    );
  }
}
