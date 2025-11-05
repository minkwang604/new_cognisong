import 'dart:convert';

import 'package:new_cognisong/domain/entities/error_message.dart';
import 'package:new_cognisong/presentation/pages/login/login_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {
  final GlobalKey<NavigatorState> navigatorKey;

  AuthInterceptor(this.navigatorKey);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final isExcluded = options.path.startsWith('/user/login');

    if (!isExcluded && prefs.getString('code') != null) {
      options.headers['Authorization'] = "Bearer ${prefs.getString('code')}";
    }

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.data is String) {
      response.data = json.decode(response.data);
    }
    return handler.next(response);
  }

  @override
  void onError(error, ErrorInterceptorHandler handler) async {
    if (error.response?.statusCode == 401) {
      // 세션 만료 처리
      _showDialog(ErrorMessage.fromJson(error.response?.data));

      return;
    }
    handler.next(error); // 오류를 계속 진행
  }

  void _showDialog(ErrorMessage error) {
    final currentContext = navigatorKey.currentState?.overlay?.context;
    if (currentContext != null) {
      showDialog(
        context: currentContext,
        useRootNavigator: true,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: Text(error.error, style: const TextStyle(fontSize: 16)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false,
                );
              },
              child: const Text("확인"),
            ),
          ],
        ),
      );
    }
  }
}
