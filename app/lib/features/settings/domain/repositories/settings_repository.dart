import 'dart:async';

import 'package:quickstart_flutter_bloc/features/settings/domain/models/settings_model.dart';

abstract class SettingsRepository {
  Future<void> save(SettingsModel settings);
  SettingsModel get();
}
