import 'package:micro_auth/features/auth_login/domain/entity/user_entity.dart';
import 'package:micro_auth/features/auth_login/domain/exceptions/auth_signin_service_exception.dart';
import 'package:micro_core/micro_core.dart';

abstract interface class AuthLogin {
  Future<Either<AuthSignInServiceException, UserEntity>> login(
    String email,
    String password,
  );
  Future<Either<AuthSignInServiceException, UserEntity>> loginWithGoogle();
}
