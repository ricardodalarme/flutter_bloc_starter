import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:common/di/injection_module.dart';
import 'package:common/di/injector.dart';
import 'package:quickstart_flutter_bloc/features/signup/presentation/bloc/signup_bloc.dart';

class SignupInjectionModule extends InjectionModule {
  @override
  FutureOr<void> registerDependencies({required Injector injector}) {
    injector.registerFactory<SignupBloc>(
      () => SignupBloc(
        authenticationRepository: injector.get<AuthenticationRepository>(),
      ),
    );
  }
}
