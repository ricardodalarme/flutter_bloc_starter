import 'dart:async';

import 'package:common/src/di/injector.dart';

abstract class InjectionModule {
  FutureOr<void> registerDependencies({required Injector injector});
}
