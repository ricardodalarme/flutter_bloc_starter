import 'dart:async';

import 'package:common/common.dart';
import 'package:common_data/common_data.dart';
import 'package:quickstart_flutter_bloc/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:quickstart_flutter_bloc/features/signup/data/data_sources/signup_data_source.dart';
import 'package:quickstart_flutter_bloc/features/signup/data/repositories/signup_repository.dart';
import 'package:quickstart_flutter_bloc/features/signup/domain/repositories/signup_repository.dart';
import 'package:quickstart_flutter_bloc/features/signup/presentation/bloc/signup_bloc.dart';

class SignupInjectionModule extends InjectionModule {
  @override
  FutureOr<void> registerDependencies({required Injector injector}) {
    injector.registerSingleton<SignupDataSource>(
      SignupDataSourceImpl(
        graphlQLClient: injector.get<GQLClient>(),
      ),
    );

    injector.registerSingleton<SignupRepository>(
      SignupRepositoryImpl(
        signupDataSource: injector.get<SignupDataSource>(),
      ),
    );

    injector.registerFactory<SignupBloc>(
      () => SignupBloc(
        authenticationRepository: injector.get<AuthenticationRepository>(),
        signupRepository: injector.get<SignupRepository>(),
      ),
    );
  }
}
