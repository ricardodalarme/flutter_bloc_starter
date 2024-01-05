import 'dart:async';

import 'package:common/common.dart';
import 'package:quickstart_flutter_bloc/features/authentication/domain/repositories/authentication_repository.dart';
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
