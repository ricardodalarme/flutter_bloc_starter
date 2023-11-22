import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:formz_inputs/formz_inputs.dart';
import 'package:user_repository/user_repository.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(const EditProfileState()) {
    on<EditProfileFirstNameChanged>(_onFirstNameChanged);
    on<EditProfileLastNameChanged>(_onLastNameChanged);
    on<EditProfileEmailChanged>(_onEmailChanged);
    on<EditProfileSubmitted>(_onSubmitted);
  }

  final UserRepository _userRepository;

  void _onFirstNameChanged(
    EditProfileFirstNameChanged event,
    Emitter<EditProfileState> emit,
  ) {
    emit(
      state.copyWith(firstName: NonEmptyInput.dirty(event.firstName)),
    );
  }

  void _onLastNameChanged(
    EditProfileLastNameChanged event,
    Emitter<EditProfileState> emit,
  ) {
    emit(
      state.copyWith(lastName: NonEmptyInput.dirty(event.lastName)),
    );
  }

  void _onEmailChanged(
    EditProfileEmailChanged event,
    Emitter<EditProfileState> emit,
  ) {
    emit(
      state.copyWith(email: EmailInput.dirty(event.email)),
    );
  }

  Future<void> _onSubmitted(
    EditProfileSubmitted event,
    Emitter<EditProfileState> emit,
  ) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _userRepository.updateProfile(
        firstName: state.firstName.value,
        lastName: state.lastName.value,
        email: state.email.value,
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (error) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
