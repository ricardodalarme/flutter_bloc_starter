import 'dart:async';

import 'package:common/common.dart';

abstract class AuthenticationRepository {
  Future<Result<void, Exception>> logInWithUsernameAndPassword({
    required String username,
    required String password,
  });

  Future<Result<void, Exception>> logInWithGoogle();
  Future<Result<void, Exception>> logInWithFacebook();

  Future<Result<void, Exception>> signUp({
    required String email,
    required String password,
  });

  Future<Result<void, Exception>> logOut();
}
