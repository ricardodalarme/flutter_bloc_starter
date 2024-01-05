import 'package:common/common.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/data_sources/authentication_data_source.dart';
import 'package:quickstart_flutter_bloc/features/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  const AuthenticationRepositoryImpl({
    required AuthenticationDataSource loginDataSource,
  }) : _loginDataSource = loginDataSource;

  final AuthenticationDataSource _loginDataSource;

  @override
  Future<Result<void, Exception>> logInWithUsernameAndPassword({
    required String username,
    required String password,
  }) async {
    try {
      await _loginDataSource.logInWithUsernameAndPassword(
        username: username,
        password: password,
      );
      return const Success(null);
    } on Exception catch (exception) {
      return Failure(exception);
    }
  }

  @override
  Future<Result<void, Exception>> logInWithGoogle() async {
    return Failure(Exception());
  }

  @override
  Future<Result<void, Exception>> logInWithFacebook() async {
    return Failure(Exception());
  }

  @override
  Future<Result<void, Exception>> logOut() async {
    return Failure(Exception());
  }

  @override
  Future<Result<void, Exception>> signUp({
    required String email,
    required String password,
  }) async {
    return Failure(Exception());
  }
}
