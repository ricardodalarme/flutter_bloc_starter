import 'dart:async';

import 'package:common/data/gql_client.dart';
import 'package:common/di/injection_module.dart';
import 'package:common/di/injector.dart';
import 'package:quickstart_flutter_bloc/features/forgot_password/data/data_sources/forgot_data_source.dart';
import 'package:quickstart_flutter_bloc/features/forgot_password/data/repositories/forgot_password_repository.dart';
import 'package:quickstart_flutter_bloc/features/forgot_password/domain/repositories/forgot_password_repository.dart';
import 'package:quickstart_flutter_bloc/features/forgot_password/presentation/bloc/forgot_password_bloc.dart';

class ForgotPasswordInjectionModule extends InjectionModule {
  @override
  FutureOr<void> registerDependencies({required Injector injector}) {
    injector.registerLazySingleton<ForgotPasswordDataSource>(
      () => ForgotPasswordDataSourceImpl(
        graphlQLClient: injector.get<GQLClient>(),
      ),
    );

    injector.registerLazySingleton<ForgotPasswordRepository>(
      () => ForgotPasswordRepositoryImpl(
        forgotPasswordDataSource: injector.get<ForgotPasswordDataSource>(),
      ),
    );

    injector.registerFactory<ForgotPasswordBloc>(
      () => ForgotPasswordBloc(
        forgotPasswordRepository: injector.get<ForgotPasswordRepository>(),
      ),
    );
  }
}
