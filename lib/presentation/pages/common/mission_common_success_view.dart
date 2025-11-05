import 'package:new_cognisong/core/layouts/orientation_layout.dart';
import 'package:flutter/material.dart';

class MissionCommonSuccessView extends StatelessWidget {
  const MissionCommonSuccessView({
    super.key,
    required this.text,
    required this.appBarTitle,
    this.isAdmin = false,
    this.color,
  });

  final String appBarTitle;
  final String text;
  final bool isAdmin;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return OrientationLayout(
      customContent: (context) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xffe7e7e7),
            toolbarHeight: 60,
            title: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    appBarTitle,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/reward.png',
                  width: 147,
                  height: 124,
                ),
                const SizedBox(height: 16),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: color ?? Theme.of(context).primaryColor,
                  ),
                ),
                isAdmin
                    ? Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: OutlinedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(82.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const SizedBox(
                            width: 310,
                            height: 40,
                            child: Center(
                              child: Text(
                                "홈으로 돌아가기",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        );
      },
      isRequiredPortrait: false,
    );
  }
}
