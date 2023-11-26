part of 'signup_bloc.dart';

final class SignupState extends Equatable with FormzMixin {
  const SignupState({
    this.username = const NonEmptyInput.pure(),
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
    this.confirmPassword = const ConfirmedPasswordInput.pure(),
    this.status = FormzSubmissionStatus.initial,
  });

  final NonEmptyInput username;
  final EmailInput email;
  final PasswordInput password;
  final ConfirmedPasswordInput confirmPassword;
  final FormzSubmissionStatus status;

  SignupState copyWith({
    NonEmptyInput? username,
    EmailInput? email,
    PasswordInput? password,
    ConfirmedPasswordInput? confirmPassword,
    FormzSubmissionStatus? status,
  }) {
    return SignupState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      status: status ?? this.status,
    );
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs =>
      [username, email, password, confirmPassword];

  @override
  List<Object?> get props =>
      [username, email, password, confirmPassword, status];
}
