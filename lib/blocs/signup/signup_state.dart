part of 'signup_bloc.dart';

@immutable
final class SignupState {
  const SignupState({
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
  });

  final String email;
  final String password;
  final String confirmPassword;

  SignupState copyWith({
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return SignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
