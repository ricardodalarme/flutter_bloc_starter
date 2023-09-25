part of 'edit_profile_bloc.dart';

@immutable
final class EditProfileState with FormzMixin {
  const EditProfileState({
    this.status = FormzSubmissionStatus.initial,
    this.firstName = const NonEmptyInput.pure(),
    this.lastName = const NonEmptyInput.pure(),
    this.email = const EmailInput.pure(),
  });

  final FormzSubmissionStatus status;
  final NonEmptyInput firstName;
  final NonEmptyInput lastName;
  final EmailInput email;

  EditProfileState copyWith({
    FormzSubmissionStatus? status,
    NonEmptyInput? firstName,
    NonEmptyInput? lastName,
    EmailInput? email,
  }) {
    return EditProfileState(
      status: status ?? this.status,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
    );
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [firstName, lastName, email];
}
