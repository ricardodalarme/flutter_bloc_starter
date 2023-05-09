part of 'change_password_bloc.dart';

@immutable
final class ChangePasswordState {
  const ChangePasswordState({
    this.currentPassword = '',
    this.newPassword = '',
    this.confirmPassword = '',
  });

  final String currentPassword;
  final String newPassword;
  final String confirmPassword;

  ChangePasswordState copyWith({
    String? currentPassword,
    String? newPassword,
    String? confirmPassword,
  }) {
    return ChangePasswordState(
      currentPassword: currentPassword ?? this.currentPassword,
      newPassword: newPassword ?? this.newPassword,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
