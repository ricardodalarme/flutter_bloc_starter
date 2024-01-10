part of 'change_password_bloc.dart';

final class ChangePasswordState with EquatableMixin, FormzMixin {
  const ChangePasswordState({
    this.currentPassword = const NonEmptyInput.pure(),
    this.password = const NonEmptyInput.pure(),
    this.confirmPassword = const ConfirmedPasswordInput.pure(),
    this.status = FormzSubmissionStatus.initial,
  });

  final NonEmptyInput currentPassword;
  final NonEmptyInput password;
  final ConfirmedPasswordInput confirmPassword;
  final FormzSubmissionStatus status;

  ChangePasswordState copyWith({
    NonEmptyInput? currentPassword,
    NonEmptyInput? password,
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
