import 'package:new_cognisong/presentation/blocs/test/test_bloc.dart';
import 'package:new_cognisong/presentation/pages/test/view/test_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TestBloc(),
      child: const TestView(),
    );
  }
}
