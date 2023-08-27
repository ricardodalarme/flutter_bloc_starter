import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:formz_inputs/formz_inputs.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc() : super(const EditProfileState()) {
    on<EditProfileFirstNameChanged>(_onFirstNameChanged);
    on<EditProfileLastNameChanged>(_onLastNameChanged);
    on<EditProfileEmailChanged>(_onEmailChanged);
    on<EditProfileSubmitted>(_onSubmitted);
  }

  void _onFirstNameChanged(
    EditProfileFirstNameChanged event,
    Emitter<EditProfileState> emit,
  ) {}

  void _onLastNameChanged(
    EditProfileLastNameChanged event,
    Emitter<EditProfileState> emit,
  ) {}

  void _onEmailChanged(
    EditProfileEmailChanged event,
    Emitter<EditProfileState> emit,
  ) {}

  void _onSubmitted(
    EditProfileSubmitted event,
    Emitter<EditProfileState> emit,
  ) {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (error) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
