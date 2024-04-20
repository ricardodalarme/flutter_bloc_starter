import 'dart:async';

import 'package:common/common.dart';
import 'package:common_data/common_data.dart';
import 'package:quickstart_flutter_bloc/features/change_password/data/data_sources/change_password_data_source.dart';
import 'package:quickstart_flutter_bloc/features/change_password/data/repositories/change_password_repository.dart';
import 'package:quickstart_flutter_bloc/features/change_password/domain/repositories/change_password_repository.dart';
import 'package:quickstart_flutter_bloc/features/change_password/presentation/bloc/change_password_bloc.dart';

class ChangePasswordInjectionModule extends InjectionModule {
  @override
  FutureOr<void> registerDependencies({required Injector injector}) {
    injector.registerLazySingleton<ChangePasswordDataSource>(
      () => ChangePasswordDataSourceImpl(
        graphlQLClient: injector.get<GQLClient>(),
      ),
    );

    injector.registerLazySingleton<ChangePasswordRepository>(
      () => ChangePasswordRepositoryImpl(
        changePasswordDataSource: injector.get<ChangePasswordDataSource>(),
      ),
    );

    injector.registerFactory<ChangePasswordBloc>(
      () => ChangePasswordBloc(
        changePasswordRepository: injector.get<ChangePasswordRepository>(),
      ),
    );
  }
}
