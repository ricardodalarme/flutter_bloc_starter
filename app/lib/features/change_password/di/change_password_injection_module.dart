import 'dart:async';

import 'package:common/di/injection_module.dart';
import 'package:common/di/injector.dart';
import 'package:quickstart_flutter_bloc/features/change_password/data/repositories/change_password_repository.dart';
import 'package:quickstart_flutter_bloc/features/change_password/domain/repositories/change_password_repository.dart';
import 'package:quickstart_flutter_bloc/features/change_password/presentation/bloc/change_password_bloc.dart';

class ChangePasswordInjectionModule extends InjectionModule {
  @override
  FutureOr<void> registerDependencies({required Injector injector}) {
    injector.registerLazySingleton<ChangePasswordRepository>(
      ChangePasswordRepositoryImpl.new,
    );

    injector.registerFactory<ChangePasswordBloc>(
      () => ChangePasswordBloc(
        changePasswordRepository: injector.get<ChangePasswordRepository>(),
      ),
    );
  }
}
