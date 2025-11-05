import 'package:new_cognisong/core/injection_container.dart';
import 'package:new_cognisong/domain/usecases/user/user_login_usecase.dart';
import 'package:new_cognisong/presentation/blocs/login/login_bloc.dart';
import 'package:new_cognisong/presentation/blocs/login/login_state.dart';
import 'package:new_cognisong/presentation/pages/common/loadingDialog.dart';
import 'package:new_cognisong/presentation/pages/login/view/login_view.dart';
import 'package:new_cognisong/presentation/pages/separate/separate_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LoginBloc(userLoginUseCase: getIt<UserLoginUseCase>()),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          state.when(
            onSuccess: () async {
              await Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const SeparatePage()),
                (route) => false,
              );
            },
            onFailure: () {
              Navigator.pop(context);
            },
            onLoaded: () {},
            onLoading: () {
              dialog(context);
            },
          );
        },
        builder: (context, state) {
          // if (state is LoginSuccessState) return const LoginSuccessView();
          return const LoginView();
        },
      ),
    );
  }
}
