import 'package:firebase_auth/firebase_auth.dart';
import 'package:micro_auth/features/auth_signup/data/auth_signup_repository.dart';
import 'package:micro_auth/features/auth_signup/domain/exceptions/auth_signup_service_exception.dart';
import 'package:micro_auth/features/auth_signup/domain/usecase/auth_signup.dart';
import 'package:micro_core/config/fp/either.dart';

class AuthSignupImpl implements AuthSignup {
  AuthSignupImpl({
    required AuthSignupRepository authSignupRepository,
  }) : _authSignupRepository = authSignupRepository;

  final AuthSignupRepository _authSignupRepository;

  @override
  Future<Either<AuthSignUpServiceException, User?>> register(
    String email,
    String password,
  ) async {
    final registerResult = await _authSignupRepository.register(
      email,
      password,
    );

    switch (registerResult) {
      case Success():
        return Success(value: registerResult.value);
      case Failure(:final exception):
        return Failure(
          exception: AuthSignUpServiceException(
            message: exception.message,
          ),
        );
    }
  }
}
