import 'dart:async';

import 'package:common/common.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/data_sources/authentication_data_source.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/repositories/authentication_repository.dart';
import 'package:quickstart_flutter_bloc/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:secure_storage/secure_storage.dart';

class AuthenticationInjectionModule extends InjectionModule {
  @override
  FutureOr<void> registerDependencies({required Injector injector}) {
    injector.registerSingleton<AuthenticationDataSource>(
      AuthenticationDataSourceImpl(
        graphlQLClient: injector.get<GQLClient>(),
      ),
    );

    injector.registerSingleton<AuthenticationRepository>(
      AuthenticationRepositoryImpl(
        loginDataSource: injector.get<AuthenticationDataSource>(),
        storage: injector.get<SecureStorage>(),
      ),
    );
  }
}
