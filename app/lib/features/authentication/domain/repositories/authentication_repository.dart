import 'dart:async';

import 'package:common/common.dart';

abstract class AuthenticationRepository {
  Stream<bool> get isAuthenticated;

  void dispose();

  Future<Result<void>> logInWithUsernameAndPassword({
    required String username,
    required String password,
  });

  Future<Result<void>> logInWithGoogle();
  Future<Result<void>> logInWithFacebook();

  Future<Result<void>> signUp({
    required String email,
    required String password,
  });

  Future<void> logOut();
}
