part of 'app_routes.dart';

abstract class AppPaths {
  AppPaths._();

  static const home = _Paths.home;
  static const login = _Paths.login;
}

abstract class _Paths {
  static const home = '/';
  static const login = '/login';
}
