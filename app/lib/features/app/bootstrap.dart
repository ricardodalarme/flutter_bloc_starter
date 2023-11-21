import 'package:common/di/app_injector.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quickstart_flutter_bloc/features/app/di/app_injection_module.dart';
import 'package:quickstart_flutter_bloc/features/app/observers/bloc_observer.dart';
import 'package:quickstart_flutter_bloc/features/change_password/di/change_password_injection_module.dart';
import 'package:quickstart_flutter_bloc/features/edit_profile/di/edit_profile_injection_module.dart';
import 'package:quickstart_flutter_bloc/features/forgot_password/di/forgot_passowrd_injection_module.dart';
import 'package:quickstart_flutter_bloc/features/login/di/login_injection_module.dart';
import 'package:quickstart_flutter_bloc/features/post/di/post_injection_module.dart';
import 'package:quickstart_flutter_bloc/features/signup/di/signup_injection_module.dart';
import 'package:quickstart_flutter_bloc/firebase_options.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';

Future<void> bootstrap(Widget Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();

  await _setupFirebase();
  await _setupBloc();
  _registerModules();

  runApp(builder());
}

Future<void> _setupFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
}

Future<void> _setupBloc() async {
  Bloc.observer = AppBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationCacheDirectory(),
  );

  if (kDebugMode) {
    await HydratedBloc.storage.clear();
  }
}

void _registerModules() {
  final injectionModules = [
    AppInjectionModule(),
    LoginInjectionModule(),
    SignupInjectionModule(),
    ForgotPasswordInjectionModule(),
    EditProfileInjectionModule(),
    ChangePasswordInjectionModule(),
    PostInjectionModule(),
  ];

  final injector = AppInjector.instance;

  for (final injectionModule in injectionModules) {
    injectionModule.registerDependencies(injector: injector);
  }
}
