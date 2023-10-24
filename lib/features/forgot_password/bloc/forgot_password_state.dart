part of 'forgot_password_bloc.dart';

final class ForgotPasswordState extends Equatable {
  const ForgotPasswordState({
    this.email = '',
    this.code = '',
    this.password = '',
    this.confirmPassword = '',
  });

  final String email;
  final String code;
  final String password;
  final String confirmPassword;

  ForgotPasswordState copyWith({
    String? email,
    String? code,
    String? password,
    String? confirmPassword,
  }) {
    return ForgotPasswordState(
      email: email ?? this.email,
      code: code ?? this.code,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  @override
  List<Object?> get props => [email, code, password, confirmPassword];
}
