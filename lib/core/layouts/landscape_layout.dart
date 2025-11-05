import 'package:flutter/material.dart';

class LandscapeLayout extends StatelessWidget {
  const LandscapeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.cached,
                    size: 40,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.smartphone,
                    size: 80,
                    color: Colors.white,
                  ),
                  SizedBox(height: 45),
                  Text('휴대폰을',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      )),
                  Text('세로로 돌려주세요',
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
