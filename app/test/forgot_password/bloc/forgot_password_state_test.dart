import 'package:flutter_test/flutter_test.dart';
import 'package:quickstart_flutter_bloc/features/forgot_password/bloc/forgot_password_bloc.dart';

void main() {
  const email = 'email';
  const password = 'password';
  const code = 'code';

  group('ForgotPasswordState', () {
    test('returns same object when no properties are passed', () {
      expect(
        const ForgotPasswordState().copyWith(),
        const ForgotPasswordState(),
      );
    });

    test('returns object with updated email when email is passed', () {
      expect(
        const ForgotPasswordState().copyWith(email: email),
        const ForgotPasswordState(email: email),
      );
    });

    test('returns object with updated code when code is passed', () {
      expect(
        const ForgotPasswordState().copyWith(code: code),
        const ForgotPasswordState(code: code),
      );
    });

    test('returns object with updated password when password is passed', () {
      expect(
        const ForgotPasswordState().copyWith(password: password),
        const ForgotPasswordState(password: password),
      );
    });

    test(
        'returns object with updated confirmPassword when confirmPassword is passed',
        () {
      expect(
        const ForgotPasswordState().copyWith(confirmPassword: password),
        const ForgotPasswordState(confirmPassword: password),
      );
    });
  });
}
