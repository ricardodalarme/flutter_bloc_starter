import 'dart:async';

import 'package:common/common.dart';
import 'package:quickstart_flutter_bloc/features/forgot_password/bloc/forgot_password_bloc.dart';

class ForgotPasswordInjectionModule extends InjectionModule {
  @override
  FutureOr<void> registerDependencies({required Injector injector}) {
    injector.registerFactory<ForgotPasswordBloc>(
      ForgotPasswordBloc.new,
    );
  }
}
