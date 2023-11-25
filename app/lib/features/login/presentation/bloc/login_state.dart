part of 'login_bloc.dart';

final class LoginState extends Equatable with FormzMixin {
  const LoginState({
    this.username = const NonEmptyInput.pure(),
    this.password = const NonEmptyInput.pure(),
    this.status = FormzSubmissionStatus.initial,
  });

  final NonEmptyInput username;
  final NonEmptyInput password;
  final FormzSubmissionStatus status;

  LoginState copyWith({
    NonEmptyInput? username,
    NonEmptyInput? password,
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
