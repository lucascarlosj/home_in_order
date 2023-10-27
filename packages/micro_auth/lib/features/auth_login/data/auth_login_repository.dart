import 'package:micro_auth/features/auth_login/domain/entity/user_entity.dart';
import 'package:micro_auth/features/auth_login/domain/exceptions/auth_signin_exception.dart';
import 'package:micro_core/micro_core.dart';

abstract class AuthLoginRepository {
  Future<Either<AuthSignInException, UserEntity>> login(String email, String password);
  Future<Either<AuthSignInException, UserEntity>> loginWithGoogle(String email, String password);
}
