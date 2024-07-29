import 'dart:async';

import 'package:flutter_bloc_starter/features/settings/domain/models/settings_model.dart';

abstract class SettingsRepository {
  Future<void> save(SettingsModel settings);
  SettingsModel get();
}
