import 'package:micro_auth/features/auth_login/data/auth_login_repository.dart';
import 'package:micro_auth/features/auth_login/domain/entity/user_entity.dart';
import 'package:micro_auth/features/auth_login/domain/usercase/auth_login.dart';

class AuthLoginImpl implements AuthLogin {
  AuthLoginImpl({
    required AuthLoginRepository authLoginRepository,
  }) : _authLoginRepository = authLoginRepository;

  final AuthLoginRepository _authLoginRepository;

  @override
  Future<UserEntity> loginWithEmail(String email, String password) =>
      _authLoginRepository.loginWithEmail(email, password);

  @override
  Future<UserEntity> loginWithGoogle() =>
      _authLoginRepository.loginWithGoogle();
}
