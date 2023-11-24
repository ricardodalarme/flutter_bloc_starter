part of 'login_bloc.dart';

final class LoginState extends Equatable with FormzMixin {
  const LoginState({
    this.username = const NonEmptyInput.pure(),
    this.password = const PasswordInput.pure(),
    this.status = FormzSubmissionStatus.initial,
  });

  final NonEmptyInput username;
  final PasswordInput password;
  final FormzSubmissionStatus status;

  LoginState copyWith({
    NonEmptyInput? username,
    PasswordInput? password,
    FormzSubmissionStatus? status,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [username, password];

  @override
  List<Object?> get props => [username, password, status];
}
