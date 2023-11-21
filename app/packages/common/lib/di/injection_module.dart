import 'dart:async';

import 'package:common/di/injector.dart';

abstract class InjectionModule {
  FutureOr<void> registerDependencies({required Injector injector});
}
