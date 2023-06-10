import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:formz_inputs/formz_inputs.dart';

part 'signup_event.dart';
part 'signup_state.dart';

final class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(const SignupState()) {
    on<SignupEmailChanged>(_onEmailChanged);
    on<SignupPasswordChanged>(_onPasswordChanged);
    on<SignupConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<SignupSubmitted>(_onSubmitted);
  }

  void _onEmailChanged(
    SignupEmailChanged event,
    Emitter<SignupState> emit,
  ) {
    emit(
      state.copyWith(email: Email.dirty(event.email)),
    );
  }

  void _onPasswordChanged(
    SignupPasswordChanged event,
    Emitter<SignupState> emit,
  ) {
    emit(
      state.copyWith(
        password: Password.dirty(event.password),
        confirmPassword: ConfirmedPassword.dirty(
          password: event.password,
          value: state.confirmPassword.value,
        ),
      ),
    );
  }

  void _onConfirmPasswordChanged(
    SignupConfirmPasswordChanged event,
    Emitter<SignupState> emit,
  ) {
    emit(
      state.copyWith(
        confirmPassword: ConfirmedPassword.dirty(
          password: state.password.value,
          value: event.confirmPassword,
        ),
      ),
    );
  }

  void _onSubmitted(
    SignupSubmitted event,
    Emitter<SignupState> emit,
  ) {}
}
