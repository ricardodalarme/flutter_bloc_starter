part of 'app_routes.dart';

abstract class AppPaths {
  AppPaths._();

  static const home = _Paths.home;
  static const login = _Paths.login;
  static const signup = _Paths.signup;
  static const forgotPassword = _Paths.forgotPassword;
  static const changePassword = _Paths.changePassword;
  static const editProfile = _Paths.editProfile;
  static const settings = _Paths.settings;
  static const privacyPolicy = _Paths.privacyPolicy;
}

abstract class _Paths {
  static const home = '/';
  static const login = '/login';
  static const signup = '/signup';
  static const forgotPassword = '/forgot-password';
  static const changePassword = '/change-password';
  static const editProfile = '/edit-profile';
  static const settings = '/settings';
  static const privacyPolicy = '/privacy-policy';
}
