import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickstart_flutter_bloc/features/settings/domain/repositories/settings_repository.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit({
    required SettingsRepository settingsRepository,
  })  : _settingsRepository = settingsRepository,
        super(0);

  final SettingsRepository _settingsRepository;

  void onPageChanged(int page) => emit(page);

  Future<void> onCompleted() async {
    final settings = _settingsRepository.get();
    final newSettings = settings.copyWith(hasOnboarded: true);
    await _settingsRepository.save(newSettings);
  }
}
