part of 'change_password_bloc.dart';

@immutable
final class ChangePasswordState with FormzMixin {
  const ChangePasswordState({
    this.currentPassword = const Password.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const ConfirmedPassword.pure(),
    this.status = FormzSubmissionStatus.initial,
  });

  final Password currentPassword;
  final Password password;
  final ConfirmedPassword confirmPassword;
  final FormzSubmissionStatus status;

  ChangePasswordState copyWith({
    Password? currentPassword,
    Password? password,
    ConfirmedPassword? confirmPassword,
    FormzSubmissionStatus? status,
  }) {
    return ChangePasswordState(
      currentPassword: currentPassword ?? this.currentPassword,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      status: status ?? this.status,
    );
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs =>
      [currentPassword, password, confirmPassword];
}
