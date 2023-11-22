import 'dart:async';

import 'package:common/di/injection_module.dart';
import 'package:common/di/injector.dart';
import 'package:quickstart_flutter_bloc/features/edit_profile/data/repositories/edit_profile_repository.dart';
import 'package:quickstart_flutter_bloc/features/edit_profile/domain/repositories/edit_profile_repository.dart';
import 'package:quickstart_flutter_bloc/features/edit_profile/presentation/bloc/edit_profile_bloc.dart';

class EditProfileInjectionModule extends InjectionModule {
  @override
  FutureOr<void> registerDependencies({required Injector injector}) {
    injector.registerLazySingleton<EditProfileRepository>(
      EditProfileRepositoryImpl.new,
    );

    injector.registerFactory<EditProfileBloc>(
      () => EditProfileBloc(
        editProfileRepository: injector.get<EditProfileRepository>(),
      ),
    );
  }
}
