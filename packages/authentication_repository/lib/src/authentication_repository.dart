import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';

class AuthenticationRepository {
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      // TODO: implement logInWithEmailAndPassword
    } catch (_) {
      throw LogInWithEmailAndPasswordException();
    }
  }

  Future<void> logInWithGoogle() async {
    try {
      // TODO: implement logInWithGoogle
    } catch (_) {
      throw LogInWithGoogleException();
    }
  }

  Future<void> logInWithFacebook() async {
    try {
      // TODO: implement logInWithFacebook
    } catch (_) {
      throw LogInWithFacebookException();
    }
  }

  Future<void> signUp({required String email, required String password}) async {
    try {
      // TODO: implement signUp
    } catch (_) {
      throw SignUpWithEmailAndPasswordException();
    }
  }

  Future<void> logOut() async {
    try {
      // TODO: implement logOut
    } catch (_) {
      throw LogOutException();
    }
  }
}
