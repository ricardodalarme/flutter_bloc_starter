part of 'login_bloc.dart';

final class LoginState extends Equatable with FormzMixin {
  const LoginState({
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
    this.status = FormzSubmissionStatus.initial,
  });

  final EmailInput email;
  final PasswordInput password;
  final FormzSubmissionStatus status;

  LoginState copyWith({
    EmailInput? email,
    PasswordInput? password,
    FormzSubmissionStatus? status,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [email, password];

  @override
  List<Object?> get props => [email, password, status];
}
