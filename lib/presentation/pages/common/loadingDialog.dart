import 'package:flutter/material.dart';

void dialog(BuildContext context) async {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return const Scaffold(
          // The background color
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: Colors.white,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 14.0),
                  child: Text("로딩중...",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      )),
                )
              ],
            ),
          ),
        );
      });
}
