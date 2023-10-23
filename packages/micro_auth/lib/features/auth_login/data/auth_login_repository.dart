import 'package:micro_auth/features/auth_login/domain/entity/user_entity.dart';

abstract class AuthLoginRepository {
  Future<UserEntity> loginWithEmail(String email, String password);
  Future<UserEntity> loginWithGoogle();
}
