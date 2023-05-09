part of 'change_password_bloc.dart';

@immutable
sealed class ChangePasswordEvent {}

final class ChangePasswordCurrentPasswordChanged extends ChangePasswordEvent {
  ChangePasswordCurrentPasswordChanged(this.email);

  final String email;
}

final class ChangePasswordNewPasswordChanged extends ChangePasswordEvent {
  ChangePasswordNewPasswordChanged(this.password);

  final String password;
}

final class ChangePasswordConfirmPasswordChanged extends ChangePasswordEvent {
  ChangePasswordConfirmPasswordChanged(this.confirmPassword);

  final String confirmPassword;
}
