import 'dart:async';

import 'package:common/common.dart';
import 'package:flutter_bloc_starter/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:flutter_bloc_starter/features/settings/domain/repositories/settings_repository.dart';

class OnboardingInjectionModule extends InjectionModule {
  @override
  FutureOr<void> registerDependencies({required Injector injector}) {
    injector.registerFactory<OnboardingCubit>(
      () => OnboardingCubit(
        settingsRepository: injector.get<SettingsRepository>(),
      ),
    );
  }
}
