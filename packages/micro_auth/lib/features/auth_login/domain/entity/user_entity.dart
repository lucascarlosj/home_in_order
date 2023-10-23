import 'package:micro_dependencies/micro_dependencies.dart';

class UserEntity {
  final String uid;
  final String name;
  final String email;
  final String photoURL;

  UserEntity({
    required this.uid,
    required this.name,
    required this.email,
    required this.photoURL,
  });

  factory UserEntity.fromFirebaseUser(User user) {
    return UserEntity(
      uid: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
      photoURL: user.photoURL ?? '',
    );
  }
}
