import 'package:new_cognisong/core/layouts/orientation_layout.dart';
import 'package:new_cognisong/presentation/blocs/login/login_bloc.dart';
import 'package:new_cognisong/presentation/blocs/login/login_event.dart';
import 'package:new_cognisong/presentation/blocs/login/login_state.dart';
import 'package:new_cognisong/presentation/pages/common/text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return OrientationLayout(
      isRequiredPortrait: false,
      customContent: (context) {
        return BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                appBar: AppBar(toolbarHeight: 0.0),
                body: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ScrollConfiguration(
                            behavior: ScrollConfiguration.of(
                              context,
                            ).copyWith(overscroll: false),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  const SizedBox(height: 40),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        '만나서 반가워요!',
                                        style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      const Text(
                                        '같이 여행을 떠나볼까요?',
                                        style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 14.0,
                                        ),
                                        child: Text(
                                          '부여받은 코드를 입력하세요!',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xff4B4B4B),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      // const SizedBox(height: 50),
                                      TextForm(
                                        name: '코드',
                                        onChanged: (value) => {
                                          context.read<LoginBloc>().add(
                                            PressKeyCodeLoginEvent(code: value),
                                          ),
                                        },
                                        isShow: false,
                                        isShowIcon: false,
                                        // iconPressed: () => {
                                        //   context
                                        //       .read<LoginBloc>()
                                        //       .add(PressButtonShowCodeEvent())
                                        // },
                                        hintText: '코드를 입력해주세요!',
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 8.0,
                                        ),
                                        child: SizedBox(
                                          height: 30,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              BlocBuilder<
                                                LoginBloc,
                                                LoginState
                                              >(
                                                builder: (context, state) {
                                                  return state
                                                          is LoginFailureState
                                                      ? Text(
                                                          state.message,
                                                          style:
                                                              const TextStyle(
                                                                color:
                                                                    Colors.red,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        )
                                                      : Container();
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Theme.of(
                                              context,
                                            ).primaryColor,
                                            disabledBackgroundColor: Theme.of(
                                              context,
                                            ).disabledColor,
                                          ),
                                          onPressed:
                                              context
                                                  .watch<LoginBloc>()
                                                  .state
                                                  .loginStateProps
                                                  .isOnClickLogin
                                              ? () {
                                                  context.read<LoginBloc>().add(
                                                    PressLoginButtonLoginEvent(),
                                                  );
                                                }
                                              : null,
                                          child: const SizedBox(
                                            width: double.infinity,
                                            height: 60,
                                            child: Center(
                                              child: Text(
                                                '로그인',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 40),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
