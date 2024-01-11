import 'package:common/common.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:formz_inputs/formz_inputs.dart';
import 'package:quickstart_flutter_bloc/features/authentication/domain/repositories/authentication_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const LoginState()) {
    on<LoginUsernameChanged>(_onUsernameChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
    on<LoginWithGoogleSubmitted>(_onLoginWithGoogleSubmitted);
    on<LoginWithFacebookSubmitted>(_onLoginWithFacebookSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

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
      state.copyWith(password: NonEmptyInput.dirty(event.password)),
    );
  }

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    final result = await _authenticationRepository.logInWithUsernameAndPassword(
      username: state.username.value,
      password: state.password.value,
    );

    final newState = switch (result) {
      Success() => state.copyWith(status: FormzSubmissionStatus.success),
      Failure() => state.copyWith(status: FormzSubmissionStatus.failure),
    };

    emit(newState);
  }

  Future<void> _onLoginWithGoogleSubmitted(
    LoginWithGoogleSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    await _authenticationRepository.logInWithGoogle();
  }

  Future<void> _onLoginWithFacebookSubmitted(
    LoginWithFacebookSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    await _authenticationRepository.logInWithFacebook();
  }
}
