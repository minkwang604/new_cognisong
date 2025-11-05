import 'package:new_cognisong/core/injection_container.dart';
import 'package:new_cognisong/presentation/pages/login/login_page.dart';
import 'package:new_cognisong/utils/auth_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  await Permission.microphone.request();

  WakelockPlus.enable();
  final dio = Dio();
  await setupLocator(dio);
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    getIt<Dio>().interceptors.add(AuthInterceptor(navigatorKey));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.transparent, elevation: 0),
        fontFamily: 'Pretendard',
        primaryColor: const Color(0xff1841DB),
        disabledColor: const Color(0xff7693FF),
        // colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffF33B33)),
        useMaterial3: false,
      ),

      // home: const Show()
      // home: const PreParationTutorialPage(),
      // home: const ModuleTutorialPage(),
      home: const LoginPage(),
      // home: ModuleBMissionPage(order: 1, color: Colors.blue),
    );
  }
}
