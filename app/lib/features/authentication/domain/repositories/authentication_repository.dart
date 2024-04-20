import 'dart:async';

abstract class AuthenticationRepository {
  Stream<bool> get isAuthenticated;

  void dispose();

  Future<void> logInWithUsernameAndPassword({
    required String username,
    required String password,
  });

  Future<void> logInWithGoogle();
  Future<void> logInWithFacebook();

  Future<void> signUp({
    required String email,
    required String password,
  });

  Future<void> logOut();
}
