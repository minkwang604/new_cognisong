class LoginStateProps {
  final String code;
  final bool isOnClickLogin;
  final bool isShowCode;

  const LoginStateProps({
    this.code = '',
    this.isOnClickLogin = false,
    this.isShowCode = false,
  });

  LoginStateProps copyWith({
    String? code,
    bool? isOnClickLogin,
    bool? isShowCode,
  }) {
    return LoginStateProps(
      code: code ?? this.code,
      isOnClickLogin: isOnClickLogin ?? this.isOnClickLogin,
      isShowCode: isShowCode ?? this.isShowCode,
    );
  }
}
