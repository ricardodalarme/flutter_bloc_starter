import 'dart:async';

import 'package:common/common.dart';
import 'package:quickstart_flutter_bloc/features/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:user_repository/user_repository.dart';

class EditProfileInjectionModule extends InjectionModule {
  @override
  FutureOr<void> registerDependencies({required Injector injector}) {
    injector.registerFactory<EditProfileBloc>(
      () => EditProfileBloc(
        userRepository: injector.get<UserRepository>(),
      ),
    );
  }
}
