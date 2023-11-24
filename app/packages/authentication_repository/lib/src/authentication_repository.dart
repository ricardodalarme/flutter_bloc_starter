import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';

class AuthenticationRepository {
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
