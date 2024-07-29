import 'dart:async';

import 'package:common/common.dart';
import 'package:flutter_bloc_starter/features/settings/data/data_sources/models/settings_local.dart';
import 'package:flutter_bloc_starter/features/settings/data/data_sources/settings_local_data_source.dart';
import 'package:flutter_bloc_starter/features/settings/data/mappers/settings_local_to_model_mapper.dart';
import 'package:flutter_bloc_starter/features/settings/data/mappers/settings_model_to_local_mapper.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository_impl.dart';
import 'package:flutter_bloc_starter/features/settings/domain/models/settings_model.dart';
import 'package:flutter_bloc_starter/features/settings/domain/repositories/settings_repository.dart';
import 'package:persistent_storage_service/persistent_storage_service.dart';

class SettingsInjectionModule extends InjectionModule {
  @override
  FutureOr<void> registerDependencies({required Injector injector}) {
    injector.registerSingleton<SettingsLocalDataSource>(
      SettingsLocalDataSourceImpl(
        storage: injector.get<PersistentStorageService>(),
      ),
    );

    injector.registerFactory<Mapper<SettingsLocal, SettingsModel>>(
      SettingsLocalToModelMapper.new,
    );

    injector.registerFactory<Mapper<SettingsModel, SettingsLocal>>(
      SettingsModelToLocalMapper.new,
    );

    injector.registerSingleton<SettingsRepository>(
      SettingsRepositoryImpl(
        localDataSource: injector.get<SettingsLocalDataSource>(),
        settingsLocalToModelMapper:
            injector.get<Mapper<SettingsLocal, SettingsModel>>(),
        settingsModelToLocalMapper:
            injector.get<Mapper<SettingsModel, SettingsLocal>>(),
      ),
    );
  }
}
