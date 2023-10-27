import 'dart:developer';

import 'package:micro_auth/features/auth_login/data/auth_login_repository.dart';
import 'package:micro_auth/features/auth_login/domain/entity/user_entity.dart';
import 'package:micro_auth/features/auth_login/domain/exceptions/auth_signin_exception.dart';
import 'package:micro_core/config/fp/either.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

class AuthLoginRepositoryImpl implements AuthLoginRepository {
  final _firebaseAuth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  @override
  Future<Either<AuthSignInException, UserEntity>> login(
    String email,
    String password,
  ) async {
    try {
      final UserCredential(:user) =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Success(value: UserEntity.fromFirebaseUser(user!));
    } on FirebaseAuthException catch (e, s) {
      if (e.code == 'wrong-password') {
        return Failure(exception: AuthSignInUnauthorizedException());
      }
      log('Erro ao realizar login', error: e, stackTrace: s);
      return Failure(exception: AuthSignInError(message: 'Erro ao realizar login'));
    }
  }

  @override
  Future<Either<AuthSignInException, UserEntity>> loginWithGoogle(
    String email,
    String password,
  ) async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;

      if (googleAuth == null) {
        throw Exception('Erro ao realizar o login com o Google');
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential(:user) =
          await _firebaseAuth.signInWithCredential(credential);

      return Success(value: UserEntity.fromFirebaseUser(user!));
    } on FirebaseAuthException catch (e, s) {
      log('Erro ao realizar login com o Google', error: e, stackTrace: s);
      return Failure(exception: AuthSignInError(message: 'Erro ao realizar login'));
    }
  }
}
