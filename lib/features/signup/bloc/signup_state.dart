part of 'signup_bloc.dart';

final class SignupState extends Equatable with FormzMixin {
  const SignupState({
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
    this.confirmPassword = const ConfirmedPasswordInput.pure(),
    this.status = FormzSubmissionStatus.initial,
  });

  final EmailInput email;
  final PasswordInput password;
  final ConfirmedPasswordInput confirmPassword;
  final FormzSubmissionStatus status;

  SignupState copyWith({
    EmailInput? email,
    PasswordInput? password,
    ConfirmedPasswordInput? confirmPassword,
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

  @override
  List<Object?> get props => [email, password, confirmPassword, status];
}
