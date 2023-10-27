import 'package:firebase_auth/firebase_auth.dart';
import 'package:micro_auth/features/auth_signup/data/auth_signup_repository.dart';
import 'package:micro_auth/features/auth_signup/domain/exceptions/auth_signup_exception.dart';
import 'package:micro_core/config/fp/either.dart';

class AuthSignupRepositoryImpl implements AuthSignupRepository {
  @override
  Future<Either<AuthSignUpException, User?>> register(
    String email,
    String password,
  ) async {
    try {
      final UserCredential(:user) =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Success(value: user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        final loginTypes =
            await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
        if (loginTypes.contains('password')) {
          throw AuthSignUpError(
            message: 'E-mail já utilizado, por favor escolha outro e-mail',
          );
        } else {
          throw AuthSignUpError(
            message:
                'Você se cadastrando pelo Google, por favor utilize ele para fazer o login',
          );
        }
      } else {
        throw AuthSignUpError(
          message: e.message ?? 'Erro ao registrar usuario',
        );
      }
    }
  }
}


//  @override
//   Future<Either<AuthSignInException, UserEntity>> login(
//     String email,
//     String password,
//   ) async {
//     try {
//       final UserCredential(:user) =
//           await _firebaseAuth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       return Success(value: UserEntity.fromFirebaseUser(user!));
//     } on FirebaseAuthException catch (e, s) {
//       if (e.code == 'wrong-password') {
//         return Failure(exception: AuthSignInUnauthorizedException());
//       }
//       log('Erro ao realizar login', error: e, stackTrace: s);
//       return Failure(exception: AuthSignInError(message: 'Erro ao realizar login'));
//     }
//   }