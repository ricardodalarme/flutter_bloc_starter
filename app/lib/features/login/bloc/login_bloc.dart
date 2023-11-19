import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:formz_inputs/formz_inputs.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
    on<LoginWithGoogleSubmitted>(_onLoginWithGoogleSubmitted);
    on<LoginWithFacebookSubmitted>(_onLoginWithFacebookSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onEmailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(
      state.copyWith(email: EmailInput.dirty(event.email)),
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
      await _authenticationRepository.logInWithEmailAndPassword(
        email: state.email.value,
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
      await _authenticationRepository.logInWithGoogle();
    } catch (error) {
      // TODO: Handle error
    }
  }

  Future<void> _onLoginWithFacebookSubmitted(
    LoginWithFacebookSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    try {
      await _authenticationRepository.logInWithFacebook();
    } catch (error) {
      // TODO: Handle error
    }
  }
}
