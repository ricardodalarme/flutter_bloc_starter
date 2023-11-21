import 'dart:async';

import 'package:common/di/injection_module.dart';
import 'package:common/di/injector.dart';
import 'package:quickstart_flutter_bloc/features/post/data/repositories/post_repository.dart';
import 'package:quickstart_flutter_bloc/features/post/domain/repositories/post_repository.dart';
import 'package:quickstart_flutter_bloc/features/post/presentation/bloc/post_bloc.dart';

class PostInjectionModule extends InjectionModule {
  @override
  FutureOr<void> registerDependencies({required Injector injector}) {
    injector.registerSingleton<PostRepository>(
      PostRepositoryImpl(),
    );

    injector.registerFactory<PostBloc>(
      () => PostBloc(
        postRepository: injector.get<PostRepository>(),
      ),
    );
  }
}
