import 'package:flutter/material.dart';
import 'package:micro_auth/features/auth_login/domain/exceptions/auth_signin_service_exception.dart';
import 'package:micro_auth/features/auth_login/domain/usecase/auth_login.dart';
import 'package:micro_core/micro_core.dart';

class AuthLoginNotifier extends ChangeNotifier {
  final _loginService = Injector.instance.get<AuthLogin>();

  Future<void> loginWithEmail(String email, String password) async {
    final result = await _loginService.login(email, password);

    switch (result) {
      case Success():
        return;
      case Failure(exception: AuthSignInServiceException(:final message)):
        throw message;
    }
  }

  Future<void> loginWithGoogle() async {
    final result = await _loginService.loginWithGoogle();

    switch (result) {
      case Success():
        return;
      case Failure(exception: AuthSignInServiceException(:final message)):
        throw message;
    }
  }
}
