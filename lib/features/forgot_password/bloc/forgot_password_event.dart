part of 'forgot_password_bloc.dart';

@immutable
sealed class ForgotPasswordEvent {}

final class ForgotPasswordEmailChanged extends ForgotPasswordEvent {
  ForgotPasswordEmailChanged(this.email);

  final String email;
}

final class ForgotPasswordCodeChanged extends ForgotPasswordEvent {
  ForgotPasswordCodeChanged(this.code);

  final String code;
}

final class ForgotPasswordNewPasswordChanged extends ForgotPasswordEvent {
  ForgotPasswordNewPasswordChanged(this.newPassword);

  final String newPassword;
}

final class ForgotPasswordConfirmPasswordChanged extends ForgotPasswordEvent {
  ForgotPasswordConfirmPasswordChanged(this.confirmPassword);

  final String confirmPassword;
}

final class ForgotPasswordSendEmailPressed extends ForgotPasswordEvent {}

final class ForgotPasswordConfirmCodeSubmitted extends ForgotPasswordEvent {}

final class ForgotPasswordResendCodePressed extends ForgotPasswordEvent {}

final class ForgotPasswordSubmitted extends ForgotPasswordEvent {}
