import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:common/common.dart';
import 'package:quickstart_flutter_bloc/features/login/bloc/login_bloc.dart';

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
