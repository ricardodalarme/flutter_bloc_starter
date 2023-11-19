import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:common/common.dart';
import 'package:user_repository/user_repository.dart';

class AppInjectionModule extends InjectionModule {
  @override
  FutureOr<void> registerDependencies({required Injector injector}) {
    injector.registerLazySingleton<AuthenticationRepository>(
      AuthenticationRepository.new,
    );
    injector.registerLazySingleton<UserRepository>(
      UserRepository.new,
    );
  }
}
