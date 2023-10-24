import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:formz_inputs/formz_inputs.dart';
import 'package:user_repository/user_repository.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

final class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(const ChangePasswordState()) {
    on<ChangePasswordCurrentPasswordChanged>(_onCurrentPasswordChanged);
    on<ChangePasswordNewPasswordChanged>(_onNewPasswordChanged);
    on<ChangePasswordConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<ChangePasswordSubmitted>(_onSubmitted);
  }

  final UserRepository _userRepository;

  void _onCurrentPasswordChanged(
    ChangePasswordCurrentPasswordChanged event,
    Emitter<ChangePasswordState> emit,
  ) {
    emit(
      state.copyWith(
        currentPassword: PasswordInput.dirty(event.currentPassword),
      ),
    );
  }

  void _onNewPasswordChanged(
    ChangePasswordNewPasswordChanged event,
    Emitter<ChangePasswordState> emit,
  ) {
    emit(
      state.copyWith(
        password: PasswordInput.dirty(event.password),
        confirmPassword: ConfirmedPasswordInput.dirty(
          password: event.password,
          value: state.confirmPassword.value,
        ),
      ),
    );
  }

  void _onConfirmPasswordChanged(
    ChangePasswordConfirmPasswordChanged event,
    Emitter<ChangePasswordState> emit,
  ) {
    emit(
      state.copyWith(
        confirmPassword: ConfirmedPasswordInput.dirty(
          password: state.password.value,
          value: event.confirmPassword,
        ),
      ),
    );
  }

  Future<void> _onSubmitted(
    ChangePasswordSubmitted event,
    Emitter<ChangePasswordState> emit,
  ) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _userRepository.changePassword(
        state.currentPassword.value,
        state.password.value,
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (error) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
