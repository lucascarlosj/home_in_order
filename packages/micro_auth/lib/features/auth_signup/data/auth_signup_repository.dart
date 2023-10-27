import 'package:micro_auth/features/auth_signup/domain/exceptions/auth_signup_exception.dart';
import 'package:micro_core/micro_core.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

abstract interface class AuthSignupRepository {
  Future<Either< AuthSignUpException, User?>> register(String email, String password);
}