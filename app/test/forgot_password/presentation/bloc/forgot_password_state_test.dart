import 'package:flutter_test/flutter_test.dart';
import 'package:formz_inputs/formz_inputs.dart';
import 'package:quickstart_flutter_bloc/features/forgot_password/presentation/bloc/forgot_password_bloc.dart';

void main() {
  group('ForgotPasswordState', () {
    test('returns same object when no properties are passed', () {
      expect(
        const ForgotPasswordState().copyWith(),
        const ForgotPasswordState(),
      );
    });

    test('returns object with updated email when email is passed', () {
      expect(
        const ForgotPasswordState()
            .copyWith(email: const EmailInput.dirty('email')),
        const ForgotPasswordState(email: EmailInput.dirty('email')),
      );
    });

    test('returns object with updated status when status is passed', () {
      expect(
        const ForgotPasswordState()
            .copyWith(status: FormzSubmissionStatus.inProgress),
        const ForgotPasswordState(status: FormzSubmissionStatus.inProgress),
      );
    });
  });
}
