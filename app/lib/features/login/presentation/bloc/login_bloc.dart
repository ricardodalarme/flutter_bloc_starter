import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:formz_inputs/formz_inputs.dart';
import 'package:quickstart_flutter_bloc/features/login/domain/repositories/change_password_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required LoginRepository loginRepository,
  })  : _loginRepository = loginRepository,
        super(const LoginState()) {
    on<LoginUsernameChanged>(_onUsernameChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
    on<LoginWithGoogleSubmitted>(_onLoginWithGoogleSubmitted);
    on<LoginWithFacebookSubmitted>(_onLoginWithFacebookSubmitted);
  }

  final LoginRepository _loginRepository;

  void _onUsernameChanged(
    LoginUsernameChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(
      state.copyWith(username: NonEmptyInput.dirty(event.username)),
    );
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(
      state.copyWith(password: PasswordInput.dirty(event.password)),
    );
  }

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _loginRepository.logInWithUsernameAndPassword(
        username: state.username.value,
        password: state.password.value,
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (error) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }

  Future<void> _onLoginWithGoogleSubmitted(
    LoginWithGoogleSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    try {
      await _loginRepository.logInWithGoogle();
    } catch (error) {
      // TODO: Handle error
    }
  }

  Future<void> _onLoginWithFacebookSubmitted(
    LoginWithFacebookSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    try {
      await _loginRepository.logInWithFacebook();
    } catch (error) {
      // TODO: Handle error
    }
  }
}
