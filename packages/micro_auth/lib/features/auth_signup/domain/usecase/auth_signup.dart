import 'package:micro_auth/features/auth_signup/domain/exceptions/auth_signup_service_exception.dart';
import 'package:micro_core/config/fp/either.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

abstract interface class AuthSignup {
  Future<Either<AuthSignUpServiceException, User?>> register(
    String email,
    String password,
  );
}