import 'package:common/data/result.dart';

abstract class LoginRepository {
  Future<Result<void, Exception>> logInWithUsernameAndPassword({
    required String username,
    required String password,
  });

  Future<void> logInWithGoogle();

  Future<void> logInWithFacebook();
}
