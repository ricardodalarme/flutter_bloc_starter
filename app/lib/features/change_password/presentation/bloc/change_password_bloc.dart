import 'package:common/common.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz_inputs/formz_inputs.dart';
import 'package:quickstart_flutter_bloc/features/change_password/domain/repositories/change_password_repository.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc({
    required ChangePasswordRepository changePasswordRepository,
  })  : _changePasswordRepository = changePasswordRepository,
        super(const ChangePasswordState()) {
    on<ChangePasswordCurrentPasswordChanged>(_onCurrentPasswordChanged);
    on<ChangePasswordNewPasswordChanged>(_onNewPasswordChanged);
    on<ChangePasswordConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<ChangePasswordSubmitted>(_onSubmitted);
  }

  final ChangePasswordRepository _changePasswordRepository;

  void _onCurrentPasswordChanged(
    ChangePasswordCurrentPasswordChanged event,
    Emitter<ChangePasswordState> emit,
  ) {
    emit(
      state.copyWith(
        currentPassword: NonEmptyInput.dirty(event.currentPassword),
      ),
    );
  }

  void _onNewPasswordChanged(
    ChangePasswordNewPasswordChanged event,
    Emitter<ChangePasswordState> emit,
  ) {
    emit(
      state.copyWith(
        password: NonEmptyInput.dirty(event.password),
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
    if (state.isNotValid) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    final result = await _changePasswordRepository.changePassword(
      currentPassword: state.currentPassword.value,
      newPassword: state.password.value,
    );
    final newState = switch (result) {
      Success() => state.copyWith(
          status: FormzSubmissionStatus.success,
        ),
      Failure() => state.copyWith(
          status: FormzSubmissionStatus.failure,
        ),
    };

    emit(newState);
  }
}
