import 'dart:async';

import 'package:common/common.dart';
import 'package:flutter_bloc_starter/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/login/presentation/bloc/login_bloc.dart';

class LoginInjectionModule extends InjectionModule {
  @override
  FutureOr<void> registerDependencies({required Injector injector}) {
    injector.registerFactory<LoginBloc>(
      () => LoginBloc(
        authenticationRepository: injector.get<AuthenticationRepository>(),
      ),
    );
  }
}
