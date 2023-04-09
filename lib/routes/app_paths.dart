part of 'app_routes.dart';

abstract class AppPaths {
  AppPaths._();

  static const home = _Paths.home;
  static const login = _Paths.login;
  static const signup = _Paths.signup;
}

abstract class _Paths {
  static const home = '/';
  static const login = '/login';
  static const signup = '/signup';
}
