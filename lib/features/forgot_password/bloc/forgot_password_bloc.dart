import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(const ForgotPasswordState()) {
    on<ForgotPasswordEmailChanged>(_onEmailChanged);
    on<ForgotPasswordCodeChanged>(_onCodeChanged);
    on<ForgotPasswordNewPasswordChanged>(_onNewPasswordChanged);
    on<ForgotPasswordConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<ForgotPasswordSendEmailPressed>(_onSendEmailPressed);
    on<ForgotPasswordConfirmCodeSubmitted>(_onConfirmCodeSubmitted);
    on<ForgotPasswordResendCodePressed>(_onResendCodePressed);
    on<ForgotPasswordSubmitted>(_onSubmitted);
  }

  void _onEmailChanged(
    ForgotPasswordEmailChanged event,
    Emitter<ForgotPasswordState> emit,
  ) {
    emit(state.copyWith(email: event.email));
  }

  void _onCodeChanged(
    ForgotPasswordCodeChanged event,
    Emitter<ForgotPasswordState> emit,
  ) {
    emit(state.copyWith(code: event.code));
  }

  void _onNewPasswordChanged(
    ForgotPasswordNewPasswordChanged event,
    Emitter<ForgotPasswordState> emit,
  ) {
    emit(state.copyWith(password: event.newPassword));
  }

  void _onConfirmPasswordChanged(
    ForgotPasswordConfirmPasswordChanged event,
    Emitter<ForgotPasswordState> emit,
  ) {
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }

  void _onSendEmailPressed(
    ForgotPasswordSendEmailPressed event,
    Emitter<ForgotPasswordState> emit,
  ) {}

  void _onConfirmCodeSubmitted(
    ForgotPasswordConfirmCodeSubmitted event,
    Emitter<ForgotPasswordState> emit,
  ) {}

  void _onResendCodePressed(
    ForgotPasswordResendCodePressed event,
    Emitter<ForgotPasswordState> emit,
  ) {}

  void _onSubmitted(
    ForgotPasswordSubmitted event,
    Emitter<ForgotPasswordState> emit,
  ) {}
}
