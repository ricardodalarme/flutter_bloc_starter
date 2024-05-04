import 'dart:async';

import 'package:common/common.dart';
import 'package:common_data/common_data.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/data_sources/authentication_data_source.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/data_sources/token_local_data_source.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:quickstart_flutter_bloc/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:secure_storage_service/secure_storage_service.dart';

class AuthenticationInjectionModule extends InjectionModule {
  @override
  FutureOr<void> registerDependencies({required Injector injector}) {
    injector.registerSingleton<AuthenticationDataSource>(
      AuthenticationDataSourceImpl(
        graphlQLClient: injector.get<GQLClient>(),
      ),
    );

    injector.registerSingleton<TokenLocalDataSource>(
      TokenLocalDataSourceImpl(
        storage: injector.get<SecureStorageService>(),
      ),
    );

    injector.registerSingleton<AuthenticationRepository>(
      AuthenticationRepositoryImpl(
        loginDataSource: injector.get<AuthenticationDataSource>(),
        tokenLocalDataSource: injector.get<TokenLocalDataSource>(),
      ),
    );
  }
}
