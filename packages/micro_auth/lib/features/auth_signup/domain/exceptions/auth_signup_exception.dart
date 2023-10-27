sealed class AuthSignUpException implements Exception {
  final String message;

  AuthSignUpException({required this.message});
}

class AuthSignUpError extends AuthSignUpException {
  AuthSignUpError({required super.message});
}