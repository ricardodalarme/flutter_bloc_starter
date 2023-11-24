import 'dart:async';

import 'package:common/data/gql_client.dart';
import 'package:common/di/injection_module.dart';
import 'package:common/di/injector.dart';
import 'package:quickstart_flutter_bloc/features/login/data/data_sources/login_data_source.dart';
import 'package:quickstart_flutter_bloc/features/login/data/repositories/login_repository.dart';
import 'package:quickstart_flutter_bloc/features/login/domain/repositories/change_password_repository.dart';
import 'package:quickstart_flutter_bloc/features/login/presentation/bloc/login_bloc.dart';

class LoginInjectionModule extends InjectionModule {
  @override
  FutureOr<void> registerDependencies({required Injector injector}) {
    injector.registerSingleton<LoginDataSource>(
      LoginDataSourceImpl(
        graphlQLClient: injector.get<GQLClient>(),
      ),
    );

    injector.registerSingleton<LoginRepository>(
      LoginRepositoryImpl(
        loginDataSource: injector.get<LoginDataSource>(),
      ),
    );

    injector.registerFactory<LoginBloc>(
      () => LoginBloc(
        loginRepository: injector.get<LoginRepository>(),
      ),
    );
  }
}
