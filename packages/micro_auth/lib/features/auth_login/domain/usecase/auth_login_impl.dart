import 'package:micro_auth/features/auth_login/data/auth_login_repository.dart';
import 'package:micro_auth/features/auth_login/domain/entity/user_entity.dart';
import 'package:micro_auth/features/auth_login/domain/exceptions/auth_signin_service_exception.dart';
import 'package:micro_auth/features/auth_login/domain/usecase/auth_login.dart';
import 'package:micro_core/config/fp/either.dart';
import 'package:micro_core/micro_core.dart';

class AuthLoginImpl implements AuthLogin {
  AuthLoginImpl({
    required AuthLoginRepository authLoginRepository,
  }) : _authLoginRepository = authLoginRepository;

  final AuthLoginRepository _authLoginRepository;

  @override
  Future<Either<AuthSignInServiceException, UserEntity>> login(
    String email,
    String password,
  ) async {
    final loginResult = await _authLoginRepository.login(email, password);

    switch (loginResult) {
      case Success():
        return Success(value: loginResult.value);
      case Failure(:final exception):
        return Failure(
          exception: AuthSignInServiceException(
            message: exception.message,
          ),
        );
    }
  }

  @override
  Future<Either<AuthSignInServiceException, UserEntity>> loginWithGoogle() async {
    final loginResult = await _authLoginRepository.loginWithGoogle();
    switch (loginResult) {
      case Success():
        return Success(value: loginResult.value);
      case Failure(:final exception):
        return Failure(
          exception: AuthSignInServiceException(
            message: exception.message,
          ),
        );
    }
  }
}
