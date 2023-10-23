// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:micro_auth/features/auth_token/presenter/auth_token_notifier.dart';
import 'package:micro_auth/micro_auth.dart';

class Injector extends InheritedWidget {
  late AuthLoginNotifier authLoginNotifier;
  late AuthSplashNotifier authSplashNotifier;
  late AuthTokenNotifier authTokenNotifier;

  // late OnboardingRepository onboardingRepository;

  void init() {
    authLoginNotifier = AuthLoginNotifier();
    authSplashNotifier = AuthSplashNotifier();
    authTokenNotifier = AuthTokenNotifier();
    // getStarred = GetStarredImpl(onboardingRepository: onboardingRepository);
    // _onboardingNotifier = OnboardingNotifier(
    //   getUser: getUser,
    //   getRepos: getRepos,
    //   getStarred: getStarred,
    // );
  }

  Injector({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  static Injector of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Injector>() as Injector;
  }

  @override
  bool updateShouldNotify(Injector oldWidget) => false;
}