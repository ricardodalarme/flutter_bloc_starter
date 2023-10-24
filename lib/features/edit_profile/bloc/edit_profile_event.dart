part of 'edit_profile_bloc.dart';

sealed class EditProfileEvent {}

class EditProfileFirstNameChanged extends EditProfileEvent {
  EditProfileFirstNameChanged(this.firstName);

  final String firstName;
}

class EditProfileLastNameChanged extends EditProfileEvent {
  EditProfileLastNameChanged(this.lastName);

  final String lastName;
}

class EditProfileEmailChanged extends EditProfileEvent {
  EditProfileEmailChanged(this.email);

  final String email;
}

class EditProfileSubmitted extends EditProfileEvent {}
