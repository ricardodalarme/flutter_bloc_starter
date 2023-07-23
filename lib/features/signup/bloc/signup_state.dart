part of 'signup_bloc.dart';

@immutable
final class SignupState with FormzMixin {
  const SignupState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const ConfirmedPassword.pure(),
    this.status = FormzSubmissionStatus.initial,
  });

  final Email email;
  final Password password;
  final ConfirmedPassword confirmPassword;
  final FormzSubmissionStatus status;

  SignupState copyWith({
    Email? email,
    Password? password,
    ConfirmedPassword? confirmPassword,
    FormzSubmissionStatus? status,
  }) {
    return SignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      status: status ?? this.status,
    );
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs =>
      [email, password, confirmPassword];
}
