library authentication_repository;

class AuthenticationRepository {
  Future<void> logInWithEmailAndPassword(String email, String password) async {}

  Future<void> loginWithGoogle() async {}

  Future<void> loginWithFacebook() async {}

  Future<void> signUp(String email, String password) async {}

  Future<void> logOut() async {}
}
