import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:quickstart_flutter_bloc/features/app/bloc/app_bloc.dart';
import 'package:quickstart_flutter_bloc/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:quickstart_flutter_bloc/routes/app_router.dart';

class AppInjectionModule extends InjectionModule {
  @override
  FutureOr<void> registerDependencies({required Injector injector}) {
    injector.registerLazySingleton<RootStackRouter>(
      AppRouter.new,
    );

    injector.registerLazySingleton<GQLClient>(
      GQLClientImpl.new,
    );

    injector.registerFactory<AppBloc>(
      () => AppBloc(
        authenticationRepository: injector.get<AuthenticationRepository>(),
      ),
    );
  }
}
