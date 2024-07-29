import 'package:common/common.dart';
import 'package:flutter_bloc_starter/features/settings/data/data_sources/models/settings_local.dart';
import 'package:flutter_bloc_starter/features/settings/domain/models/settings_model.dart';

final class SettingsModelToLocalMapper
    implements Mapper<SettingsModel, SettingsLocal> {
  @override
  SettingsLocal map(SettingsModel input) {
    return SettingsLocal(
      hasOnboarded: input.hasOnboarded,
    );
  }
}
