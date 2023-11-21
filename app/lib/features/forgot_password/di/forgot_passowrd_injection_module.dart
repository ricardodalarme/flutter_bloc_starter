import 'dart:async';

import 'package:common/di/injection_module.dart';
import 'package:common/di/injector.dart';
import 'package:quickstart_flutter_bloc/features/forgot_password/bloc/forgot_password_bloc.dart';

class ForgotPasswordInjectionModule extends InjectionModule {
  @override
  FutureOr<void> registerDependencies({required Injector injector}) {
    injector.registerFactory<ForgotPasswordBloc>(
      ForgotPasswordBloc.new,
    );
  }
}
