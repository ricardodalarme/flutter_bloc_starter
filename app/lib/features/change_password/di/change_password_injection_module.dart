import 'dart:async';

import 'package:common/di/injection_module.dart';
import 'package:common/di/injector.dart';
import 'package:quickstart_flutter_bloc/features/change_password/presentation/bloc/change_password_bloc.dart';
import 'package:user_repository/user_repository.dart';

class ChangePasswordInjectionModule extends InjectionModule {
  @override
  FutureOr<void> registerDependencies({required Injector injector}) {
    injector.registerFactory<ChangePasswordBloc>(
      () => ChangePasswordBloc(
        userRepository: injector.get<UserRepository>(),
      ),
    );
  }
}
