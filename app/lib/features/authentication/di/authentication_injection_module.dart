import 'dart:async';

import 'package:common/common.dart';
import 'package:common_data/common_data.dart';
import 'package:flutter_bloc_starter/features/authentication/data/data_sources/authentication_data_source.dart';
import 'package:flutter_bloc_starter/features/authentication/data/data_sources/models/token_local.dart';
import 'package:flutter_bloc_starter/features/authentication/data/data_sources/token_local_data_source.dart';
import 'package:flutter_bloc_starter/features/authentication/data/mappers/login_response_to_local_mapper.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:flutter_bloc_starter/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:schemas/mutations/generated/Login.graphql.dart';
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

    injector.registerFactory<Mapper<MutationLoginlogin, TokenLocal>>(
      LoginResponseToLocalMapper.new,
    );

    injector.registerSingleton<AuthenticationRepository>(
      AuthenticationRepositoryImpl(
        tokenLocalMapper:
            injector.get<Mapper<MutationLoginlogin, TokenLocal>>(),
        loginDataSource: injector.get<AuthenticationDataSource>(),
        tokenLocalDataSource: injector.get<TokenLocalDataSource>(),
      ),
    );
  }
}
