import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:formz_inputs/formz_inputs.dart';
import 'package:quickstart_flutter_bloc/features/change_password/bloc/change_password_bloc.dart';

void main() {
  const password = PasswordInput.dirty('password');
  const confirmPassword = ConfirmedPasswordInput.dirty(password: 'password');

  group('ChangePasswordState', () {
    test('returns same object when no properties are passed', () {
      expect(
        const ChangePasswordState().copyWith(),
        const ChangePasswordState(),
      );
    });

    test('returns object with updated status when status is passed', () {
      expect(
        const ChangePasswordState()
            .copyWith(status: FormzSubmissionStatus.initial),
        const ChangePasswordState(),
      );
    });

    test(
        'returns object with updated currentPassword when currentPassword is passed',
        () {
      expect(
        const ChangePasswordState().copyWith(currentPassword: password),
        const ChangePasswordState(currentPassword: password),
      );
    });

    test('returns object with updated password when valid is passed', () {
      expect(
        const ChangePasswordState().copyWith(password: password),
        const ChangePasswordState(password: password),
      );
    });

    test(
        'returns object with updated confirmedPassword when confirmedPassword is passed',
        () {
      expect(
        const ChangePasswordState().copyWith(confirmPassword: confirmPassword),
        const ChangePasswordState(confirmPassword: confirmPassword),
      );
    });
  });
}
