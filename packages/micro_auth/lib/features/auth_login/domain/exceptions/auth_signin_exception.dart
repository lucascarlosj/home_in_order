sealed class AuthSignInException implements Exception {
  final String message;

  AuthSignInException({required this.message});
}

class AuthSignInError extends AuthSignInException {
  AuthSignInError({required super.message});
}

class AuthSignInUnauthorizedException extends AuthSignInException {
  AuthSignInUnauthorizedException() : super(message: '');
}