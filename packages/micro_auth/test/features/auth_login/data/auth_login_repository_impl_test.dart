import 'package:flutter_test/flutter_test.dart';
import 'package:micro_auth/features/auth_login/data/auth_login_repository.dart';
import 'package:micro_auth/features/auth_login/domain/entity/user_entity.dart';
import 'package:micro_auth/features/auth_login/domain/exceptions/auth_signin_exception.dart';
import 'package:micro_core/config/fp/either.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

class MockAuthLoginRepositoryImpl extends Mock implements AuthLoginRepository {}

void main() async {
  group('Auth Login Testes', () {
    late AuthLoginRepository authLoginRepository;

    setUp(() {
      authLoginRepository = MockAuthLoginRepositoryImpl();
    });

    group('login', () {
      test('should return a UserEntity when login is successful', () async {
        const email = 'test@test.com';
        const password = 'password';
        when(() => authLoginRepository.login(email, password)).thenAnswer(
          (_) async => Success(
            value: UserEntity(
              email: '',
              name: '',
              photoURL: '',
              uid: '',
            ),
          ),
        );

        final result = await authLoginRepository.login(email, password);
        expect(result, isA<Success>());
      });

      test(
          'should return an AuthSignInUnauthorizedException when wrong password is provided',
          () async {
        const email = 'test@test.com';
        const password = 'wrong_password';

        when(() => authLoginRepository.login(email, password)).thenAnswer(
            (_) async => Failure(exception: AuthSignInUnauthorizedException()));

        final result = await authLoginRepository.login(email, password);
        expect(result, isA<Failure>());
      });

      test('should return an AuthSignInError when an error occurs during login',
          () async {
        const email = 'test@test.com';
        const password = 'password';

        when(() => authLoginRepository.login(email, password)).thenAnswer(
            (_) async => Failure(exception: AuthSignInError(message: '')));

        final result = await authLoginRepository.login(email, password);

        expect(result, isA<Failure>());
      });
    });

    group('loginWithGoogle', () {
      test('should return a UserEntity when login with Google is successful',
          () async {
        when(() => authLoginRepository.loginWithGoogle()).thenAnswer(
          (_) async => Success(
            value: UserEntity(
              email: '',
              name: '',
              photoURL: '',
              uid: '',
            ),
          ),
        );

        final result = await authLoginRepository.loginWithGoogle();

        expect(result, isA<Success>());
      });

      test(
          'should return an AuthSignInError when an error occurs during login with Google',
          () async {
        when(() => authLoginRepository.loginWithGoogle()).thenAnswer(
            (_) async => Failure(exception: AuthSignInError(message: '')));

        final result = await authLoginRepository.loginWithGoogle();

        expect(result, isA<Failure>());
      });
    });
  });
}
