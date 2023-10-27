import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micro_auth/features/auth_forgot/presenter/auth_forgot_page.dart';
import 'package:micro_auth/features/auth_login/presenter/auth_login_page.dart';
import 'package:micro_auth/features/auth_signup/presenter/auth_signup_page.dart';

class MicroAuthRoutes {
  static const login = '/login';
  static const forgot = '/forgot';
  static const signup = '/signup';

  static MicroAuthRoutes? instance;

  static MicroAuthRoutes getIntance() {
    return instance ??= MicroAuthRoutes();
  }

  final List<RouteBase> routes = [
    GoRoute(
      path: login,
      pageBuilder: (_, state) {
        return MaterialPage(
          child: AuthLoginPage(),
        );
      },
    ),
    GoRoute(
      path: forgot,
      pageBuilder: (_, state) {
        return MaterialPage(
          child: AuthForgotPage(),
        );
      },
    ),
    GoRoute(
      path: signup,
      pageBuilder: (_, state) {
        return MaterialPage(
          child: AuthSignupPage(),
        );
      },
    ),
  ];
}
