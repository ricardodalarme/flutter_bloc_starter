part of 'edit_profile_bloc.dart';

@immutable
final class EditProfileState with FormzMixin {
  const EditProfileState({
    this.status = FormzSubmissionStatus.initial,
  });

  final FormzSubmissionStatus status;

  EditProfileState copyWith({
    Password? currentPassword,
    Password? password,
    ConfirmedPassword? confirmPassword,
    FormzSubmissionStatus? status,
  }) {
    return EditProfileState(
      status: status ?? this.status,
    );
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [];
}
