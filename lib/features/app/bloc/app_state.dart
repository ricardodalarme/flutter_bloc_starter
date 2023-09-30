part of 'app_bloc.dart';

enum AppStatus { authenticated, unauthenticated }

final class AppState {
  const AppState._({
    required this.status,
  });

  const AppState.authenticated() : this._(status: AppStatus.authenticated);

  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  final AppStatus status;
}
