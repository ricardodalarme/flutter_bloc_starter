import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:crash_report_service/crash_report_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/app/di/app_injection_module.dart';
import 'package:flutter_bloc_starter/features/app/observers/bloc_observer.dart';
import 'package:flutter_bloc_starter/features/authentication/di/authentication_injection_module.dart';
import 'package:flutter_bloc_starter/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/change_password/di/change_password_injection_module.dart';
import 'package:flutter_bloc_starter/features/edit_profile/di/edit_profile_injection_module.dart';
import 'package:flutter_bloc_starter/features/forgot_password/di/forgot_password_injection_module.dart';
import 'package:flutter_bloc_starter/features/login/di/login_injection_module.dart';
import 'package:flutter_bloc_starter/features/onboarding/di/onboarding_injection_module.dart';
import 'package:flutter_bloc_starter/features/post/di/post_injection_module.dart';
import 'package:flutter_bloc_starter/features/settings/di/settings_injection_module.dart';
import 'package:flutter_bloc_starter/features/settings/domain/repositories/settings_repository.dart';
import 'package:flutter_bloc_starter/features/signup/di/signup_injection_module.dart';
import 'package:flutter_bloc_starter/firebase_options.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/routes/app_router.dart';
import 'package:persistent_storage_service/persistent_storage_service.dart';

Future<void> bootstrap(Widget Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();

  await _setupFirebase();
  await Future.wait([
    _setupBloc(),
    _registerModules(),
  ]);
  await Future.wait([
    _checkAuthenticationStatus(),
    _configureCrashReportService(),
    _initializeStorageService(),
  ]);
  _checkOnboardingStatus();

  runApp(builder());
}

Future<void> _setupFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

Future<void> _setupBloc() async {
  Bloc.observer = AppBlocObserver();
}

Future<void> _configureCrashReportService() async {
  final crashReportService = AppInjector.instance.get<CrashReportService>();

  await crashReportService.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = crashReportService.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    crashReportService.recordError(error, stack, fatal: true);
    return true;
  };
}

Future<void> _checkAuthenticationStatus() async {
  final authenticationRepository =
      AppInjector.instance.get<AuthenticationRepository>();

  await authenticationRepository.checkAuthenticationStatus();
}

Future<void> _initializeStorageService() async {
  final persistentStorageService =
      AppInjector.instance.get<PersistentStorageService>();

  await persistentStorageService.initialize();
}

void _checkOnboardingStatus() {
  final appRouter = AppInjector.instance.get<RootStackRouter>();
  final settingsRepository = AppInjector.instance.get<SettingsRepository>();
  final settings = settingsRepository.get();

  if (!settings.hasOnboarded) {
    appRouter.replaceAll([const OnboardingRoute()]);
  }
}

Future<void> _registerModules() async {
  final injectionModules = <InjectionModule>[
    AppInjectionModule(),
    AuthenticationInjectionModule(),
    OnboardingInjectionModule(),
    LoginInjectionModule(),
    SignupInjectionModule(),
    ForgotPasswordInjectionModule(),
    EditProfileInjectionModule(),
    ChangePasswordInjectionModule(),
    PostInjectionModule(),
    SettingsInjectionModule(),
  ];

  final injector = AppInjector.instance;

  for (final injectionModule in injectionModules) {
    await injectionModule.registerDependencies(injector: injector);
  }
}
