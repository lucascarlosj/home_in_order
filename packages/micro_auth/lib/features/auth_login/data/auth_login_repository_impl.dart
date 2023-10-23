import 'package:micro_auth/features/auth_login/data/auth_login_repository.dart';
import 'package:micro_auth/features/auth_login/domain/entity/user_entity.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

class AuthLoginRepositoryImpl implements AuthLoginRepository {
  final _firebaseAuth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  @override
  Future<UserEntity> loginWithEmail(String email, String password) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UserEntity.fromFirebaseUser(credential.user!);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          throw Exception('No user found for that email.');
        case 'wrong-password':
          throw Exception('Wrong password provided for that user.');
        default:
          throw Exception('Erro ao realizar o login com o email');
      }
    }
  }

  @override
  Future<UserEntity> loginWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser?.authentication;

    if (googleAuth == null) {
      throw Exception('Erro ao realizar o login com o Google');
    }

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredential = await _firebaseAuth.signInWithCredential(credential);

    return UserEntity.fromFirebaseUser(userCredential.user!);
  }
}
