import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:common/di/injection_module.dart';
import 'package:common/di/injector.dart';
import 'package:quickstart_flutter_bloc/features/app/bloc/app_bloc.dart';
import 'package:quickstart_flutter_bloc/routes/app_router.dart';

class AppInjectionModule extends InjectionModule {
  @override
  FutureOr<void> registerDependencies({required Injector injector}) {
    injector.registerLazySingleton<RootStackRouter>(
      AppRouter.new,
    );

    injector.registerLazySingleton<AuthenticationRepository>(
      AuthenticationRepository.new,
    );

    injector.registerFactory<AppBloc>(
      () => AppBloc(
        authenticationRepository: injector.get<AuthenticationRepository>(),
      ),
    );
  }
}
