import 'package:common/common.dart';
import 'package:flutter_bloc_starter/features/settings/data/data_sources/models/settings_local.dart';
import 'package:flutter_bloc_starter/features/settings/domain/models/settings_model.dart';

final class SettingsLocalToModelMapper
    implements Mapper<SettingsLocal, SettingsModel> {
  @override
  SettingsModel map(SettingsLocal input) {
    return SettingsModel(
      hasOnboarded: input.hasOnboarded,
    );
  }
}
