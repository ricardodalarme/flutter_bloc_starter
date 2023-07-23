import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_starter/features/change_password/change_password_view.dart';
import 'package:flutter_bloc_starter/features/forgot_password/forgot_password_view.dart';
import 'package:flutter_bloc_starter/features/home/home_view.dart';
import 'package:flutter_bloc_starter/features/login/login_view.dart';
import 'package:flutter_bloc_starter/features/not_found/not_found_view.dart';
import 'package:flutter_bloc_starter/features/signup/signup_view.dart';
import 'package:go_router/go_router.dart';

part 'app_paths.dart';

abstract class AppRoutes {
  static final GoRouter router = GoRouter(
    routes: _routes,
    initialLocation: AppPaths.login,
    debugLogDiagnostics: kDebugMode,
    errorBuilder: (context, state) => const NotFoundView(),
    observers: [
      FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
    ],
  );

  static final _routes = <GoRoute>[
    GoRoute(
      path: _Paths.login,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: _Paths.home,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: _Paths.signup,
      builder: (context, state) => const SignUpView(),
    ),
    GoRoute(
      path: _Paths.forgotPassword,
      builder: (context, state) => const ForgotPasswordView(),
    ),
    GoRoute(
      path: _Paths.changePassword,
      builder: (context, state) => const ChangePasswordView(),
    ),
  ];
}
