import 'dart:async';

import 'package:common/common.dart';

abstract class InjectionModule {
  FutureOr<void> registerDependencies({required Injector injector});
}
