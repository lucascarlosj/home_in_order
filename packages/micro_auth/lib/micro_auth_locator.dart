import 'package:micro_auth/features/auth_login/data/auth_login_repository.dart';
import 'package:micro_auth/features/auth_login/data/auth_login_repository_impl.dart';
import 'package:micro_auth/features/auth_login/domain/usecase/auth_login.dart';
import 'package:micro_auth/features/auth_login/domain/usecase/auth_login_impl.dart';
import 'package:micro_auth/features/auth_login/presenter/auth_login_notifier.dart';
import 'package:micro_auth/features/auth_signup/data/auth_signup_repository.dart';
import 'package:micro_auth/features/auth_signup/data/auth_signup_repository_impl.dart';
import 'package:micro_auth/features/auth_signup/domain/usecase/auth_signup.dart';
import 'package:micro_auth/features/auth_signup/domain/usecase/auth_signup_impl.dart';
import 'package:micro_auth/features/auth_signup/presenter/auth_signup_notifier.dart';
import 'package:micro_core/micro_core.dart';

void microAuthLocator(Injector injector) {
  // AUTH LOGIN
  injector.add<AuthLoginRepository>(AuthLoginRepositoryImpl());
  injector.add<AuthLogin>(
    AuthLoginImpl(
      authLoginRepository: Injector.instance.get<AuthLoginRepository>(),
    ),
  );

  // AUTH SIGNUP
  injector.add<AuthSignupRepository>(AuthSignupRepositoryImpl());
  injector.add<AuthSignup>(
    AuthSignupImpl(
      authSignupRepository: Injector.instance.get<AuthSignupRepository>(),
    ),
  );

  // Controllers
  injector.add<AuthLoginNotifier>(AuthLoginNotifier());
  injector.add<AuthSignupNotifier>(AuthSignupNotifier());
}
