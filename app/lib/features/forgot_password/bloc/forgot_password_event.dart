part of 'forgot_password_bloc.dart';

sealed class ForgotPasswordEvent {
  const ForgotPasswordEvent();
}

final class ForgotPasswordEmailChanged extends ForgotPasswordEvent {
  const ForgotPasswordEmailChanged(this.email);

  final String email;
}

final class ForgotPasswordCodeChanged extends ForgotPasswordEvent {
  const ForgotPasswordCodeChanged(this.code);

  final String code;
}

final class ForgotPasswordNewPasswordChanged extends ForgotPasswordEvent {
  const ForgotPasswordNewPasswordChanged(this.newPassword);

  final String newPassword;
}

final class ForgotPasswordConfirmPasswordChanged extends ForgotPasswordEvent {
  const ForgotPasswordConfirmPasswordChanged(this.confirmPassword);

  final String confirmPassword;
}

final class ForgotPasswordSendEmailPressed extends ForgotPasswordEvent {
  const ForgotPasswordSendEmailPressed();
}

final class ForgotPasswordConfirmCodeSubmitted extends ForgotPasswordEvent {
  const ForgotPasswordConfirmCodeSubmitted();
}

final class ForgotPasswordResendCodePressed extends ForgotPasswordEvent {
  const ForgotPasswordResendCodePressed();
}

final class ForgotPasswordSubmitted extends ForgotPasswordEvent {
  const ForgotPasswordSubmitted();
}
