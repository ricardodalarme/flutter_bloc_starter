import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:formz_inputs/formz_inputs.dart';
import 'package:quickstart_flutter_bloc/features/login/bloc/login_bloc.dart';

void main() {
  const email = EmailInput.dirty('email');
  const password = PasswordInput.dirty('password');

  group('LoginState', () {
    test('returns same object when no properties are passed', () {
      expect(const LoginState().copyWith(), const LoginState());
    });

    test('returns object with updated status when status is passed', () {
      expect(
        const LoginState().copyWith(status: FormzSubmissionStatus.initial),
        const LoginState(),
      );
    });

    test('returns object with updated email when email is passed', () {
      expect(
        const LoginState().copyWith(email: email),
        const LoginState(email: email),
      );
    });

    test('returns object with updated password when password is passed', () {
      expect(
        const LoginState().copyWith(password: password),
        const LoginState(password: password),
      );
    });
  });
}
