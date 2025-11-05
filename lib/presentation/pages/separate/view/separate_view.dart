import 'package:new_cognisong/core/layouts/orientation_layout.dart';
import 'package:new_cognisong/presentation/blocs/separate/separate_bloc.dart';
import 'package:new_cognisong/presentation/pages/login/login_page.dart';
import 'package:new_cognisong/presentation/pages/practice/practice_page.dart';
import 'package:new_cognisong/presentation/pages/separate/separate_page.dart';
import 'package:new_cognisong/presentation/pages/test/test_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://youtu.be/HBPqE89PzY8');

class SeparateView extends StatelessWidget {
  const SeparateView({super.key});
  Future<void> showSettingDialog(
    BuildContext context,
    SeparateBloc separateBloc,
  ) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '설정',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text('사이버 보안 위협 시 긴급 연락처'),
                const Text('제조사 지원 센터: 010-****-****'),
                const Text('이메일 : support@emcog.com'),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      child: const Text('로그아웃'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        showLogoutConfirmationDialog(context, separateBloc);
                      },
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

  Future<void> showLogoutConfirmationDialog(
    BuildContext context,
    SeparateBloc separateBloc,
  ) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('로그아웃'),
          content: const Text('정말 로그아웃하시겠어요?'),
          actions: <Widget>[
            TextButton(
              child: const Text('취소'),
              onPressed: () {
                Navigator.of(context).pop(); // 다이얼로그 닫기, false 반환
              },
            ),
            TextButton(
              child: const Text('확인'),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                separateBloc.add(LogoutEvent(token: prefs.getString("code")!));
                await prefs.remove('code');
                await Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false,
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return OrientationLayout(
      isRequiredPortrait: false,
      customContent: (context) {
        return Scaffold(
          body: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // OutlinedButton(
                        //     onPressed: () async {
                        //       getIt<UserUpdateUserStatUsecase>()
                        //           .execute(UpdateUserStat(
                        //         isPracticed: true,
                        //       ));
                        //     },
                        //     child: const Text('인정')),

                        //     child: const Text('인정')),
                        Image.asset(
                          'assets/images/logo_blue.png',
                          width: 60,
                          height: 70,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          '코그니송',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Text(
                          '오늘도 힘차게 시작해볼까요!',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    BlocBuilder<SeparateBloc, SeparateState>(
                      builder: (context, state) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  state is SeparateLoadedState
                                      ? state.text
                                      : '',
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(82.0),
                                ),
                              ),
                              onPressed: () {
                                if (state is SeparateLoadedState) {
                                  context.read<SeparateBloc>().add(
                                    InitSeparateEvent(isFirst: false),
                                  );
                                }
                              },
                              child: const SizedBox(
                                width: 310,
                                height: 40,
                                child: Center(
                                  child: Text(
                                    "시작하기",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            //state.isModule 연습을 해본 사람이 true임
                            state is SeparateLoadedState
                                ? !state.isModule && state.isUser
                                      ? Container()
                                      : ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Theme.of(
                                              context,
                                            ).primaryColor,
                                            elevation: 0.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(82.0),
                                            ),
                                          ),
                                          onPressed: () {
                                            // print(state.isUser);
                                            // print(state.isModule);
                                            if (state.isUser) {
                                              if (state.isModule) {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => PracticePage(
                                                      onComplete: () async {
                                                        Navigator.pushAndRemoveUntil(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                const SeparatePage(
                                                                  isFirst: true,
                                                                ),
                                                          ),
                                                          (route) => false,
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                );
                                              }
                                            } else {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const TestPage(),
                                                ),
                                              );
                                            }
                                          },
                                          child: SizedBox(
                                            width: 310,
                                            height: 40,
                                            child: Center(
                                              child: Text(
                                                (!state.isUser
                                                    ? "테스트 하기"
                                                    : state.isModule
                                                    ? '연습하기'
                                                    : ""),
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                : Container(),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 55,
                top: 20,
                child: GestureDetector(
                  onTap: () async {
                    await linkToHelpVideo(_url);
                  },
                  child: const Icon(Icons.help, color: Colors.grey, size: 32.0),
                ),
              ),
              Positioned(
                right: 20,
                top: 20,
                child: GestureDetector(
                  onTap: () {
                    showSettingDialog(context, context.read<SeparateBloc>());
                  },
                  child: const Icon(
                    Icons.settings,
                    color: Colors.grey,
                    size: 32.0,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

Future<void> linkToHelpVideo(Uri url) async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
