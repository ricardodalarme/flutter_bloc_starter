part of 'change_password_bloc.dart';

sealed class ChangePasswordEvent {}

final class ChangePasswordCurrentPasswordChanged extends ChangePasswordEvent {
  ChangePasswordCurrentPasswordChanged(this.currentPassword);

  final String currentPassword;
}

final class ChangePasswordNewPasswordChanged extends ChangePasswordEvent {
  ChangePasswordNewPasswordChanged(this.password);

  final String password;
}

final class ChangePasswordConfirmPasswordChanged extends ChangePasswordEvent {
  ChangePasswordConfirmPasswordChanged(this.confirmPassword);

  final String confirmPassword;
}

final class ChangePasswordSubmitted extends ChangePasswordEvent {}
