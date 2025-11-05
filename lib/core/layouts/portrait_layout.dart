import 'dart:math';

import 'package:flutter/material.dart';

class PortraitLayout extends StatelessWidget {
  const PortraitLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Icon(
                    Icons.cached,
                    size: 40,
                    color: Colors.white,
                  ),
                  Transform.rotate(
                    angle: 90 * pi / 180,
                    child: const Icon(
                      Icons.smartphone,
                      size: 80,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 45),
                  const Text('휴대폰을',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      )),
                  const Text('가로로 돌려주세요',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ))
                ],
              ),
            ],
          ),
        ));
  }
}
