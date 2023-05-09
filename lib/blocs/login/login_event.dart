part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class LoginEmailChanged extends LoginEvent {
  LoginEmailChanged(this.email);

  final String email;
}

final class LoginPasswordChanged extends LoginEvent {
  LoginPasswordChanged(this.password);

  final String password;
}
