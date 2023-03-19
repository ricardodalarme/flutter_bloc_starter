import 'package:flutter_bloc_starter/pages/home/home_view.dart';
import 'package:go_router/go_router.dart';

part 'app_paths.dart';

abstract class AppRoutes {
  static final GoRouter router = GoRouter(
    routes: _routes,
    initialLocation: AppPaths.home,
  );

  static final _routes = <GoRoute>[
    GoRoute(
      path: _Paths.home,
      builder: (context, state) => const HomeView(),
    ),
  ];
}
