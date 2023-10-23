import 'package:micro_auth/features/auth_login/domain/entity/user_entity.dart';

abstract interface class AuthLogin {
  Future<UserEntity> loginWithEmail(String email, String password);
  Future<UserEntity> loginWithGoogle();
}
