import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/repositories/authentication_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(AppState()) {
    on<AppLogoutRequested>(_onLogoutRequested);
  }

  final AuthenticationRepository _authenticationRepository;

  Future<void> _onLogoutRequested(
    AppLogoutRequested event,
    Emitter<AppState> emit,
  ) async {
    await _authenticationRepository.logOut();
  }
}
