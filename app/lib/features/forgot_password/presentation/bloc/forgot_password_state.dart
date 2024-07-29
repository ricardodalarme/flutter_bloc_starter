part of 'forgot_password_bloc.dart';

final class ForgotPasswordState with EquatableMixin, FormzMixin {
  const ForgotPasswordState({
    this.email = const EmailInput.pure(),
    this.status = FormzSubmissionStatus.initial,
  });

  final EmailInput email;
  final FormzSubmissionStatus status;

  ForgotPasswordState copyWith({
    EmailInput? email,
    FormzSubmissionStatus? status,
  }) {
    return ForgotPasswordState(
      email: email ?? this.email,
      status: status ?? this.status,
    );
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [email];

  @override
  List<Object?> get props => [email, status];
}
