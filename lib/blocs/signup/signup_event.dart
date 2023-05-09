part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

final class SignupEmailChanged extends SignupEvent {
  SignupEmailChanged(this.email);

  final String email;
}

final class SignupPasswordChanged extends SignupEvent {
  SignupPasswordChanged(this.password);

  final String password;
}

final class SignupConfirmPasswordChanged extends SignupEvent {
  SignupConfirmPasswordChanged(this.confirmPassword);

  final String confirmPassword;
}
