import 'dart:async';

import 'package:analytics_service/analytics_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:common_data/common_data.dart';
import 'package:crash_report_service/crash_report_service.dart';
import 'package:quickstart_flutter_bloc/features/app/bloc/app_bloc.dart';
import 'package:quickstart_flutter_bloc/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:quickstart_flutter_bloc/routes/app_router.dart';
import 'package:remote_config_service/remote_config_service.dart';
import 'package:secure_storage/secure_storage.dart';

class AppInjectionModule extends InjectionModule {
  @override
  FutureOr<void> registerDependencies({required Injector injector}) {
    injector.registerLazySingleton<RootStackRouter>(
      AppRouter.new,
    );

    injector.registerLazySingleton<SecureStorage>(
      SecureStorage.new,
    );

    injector.registerLazySingleton<GQLClient>(
      () => GQLClientImpl(
        storage: injector.get<SecureStorage>(),
      ),
    );

    injector.registerLazySingleton<RestClient>(
      RestClientImpl.new,
    );

    injector.registerSingleton<AnalyticsService>(
      AnalyticsServiceImpl(),
    );

    injector.registerSingleton<RemoteConfigService>(
      RemoteConfigServiceImpl(),
    );

    injector.registerSingleton<CrashReportService>(
      CrashReportServiceImpl(),
    );

    injector.registerFactory<AppBloc>(
      () => AppBloc(
        authenticationRepository: injector.get<AuthenticationRepository>(),
      ),
    );
  }
}
