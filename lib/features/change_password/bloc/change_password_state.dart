part of 'change_password_bloc.dart';

final class ChangePasswordState extends Equatable with FormzMixin {
  const ChangePasswordState({
    this.currentPassword = const PasswordInput.pure(),
    this.password = const PasswordInput.pure(),
    this.confirmPassword = const ConfirmedPasswordInput.pure(),
    this.status = FormzSubmissionStatus.initial,
  });

  final PasswordInput currentPassword;
  final PasswordInput password;
  final ConfirmedPasswordInput confirmPassword;
  final FormzSubmissionStatus status;

  ChangePasswordState copyWith({
    PasswordInput? currentPassword,
    PasswordInput? password,
    ConfirmedPasswordInput? confirmPassword,
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

  @override
  List<Object?> get props =>
      [currentPassword, password, confirmPassword, status];
}
