import 'package:common/common.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/data_sources/authentication_data_source.dart';
import 'package:quickstart_flutter_bloc/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:storage/storage.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  const AuthenticationRepositoryImpl({
    required AuthenticationDataSource loginDataSource,
    required Storage storage,
  })  : _loginDataSource = loginDataSource,
        _storage = storage;

  final AuthenticationDataSource _loginDataSource;
  final Storage _storage;

  @override
  Future<Result<void, Exception>> logInWithUsernameAndPassword({
    required String username,
    required String password,
  }) async {
    try {
      final (accessToken, _) =
          await _loginDataSource.logInWithUsernameAndPassword(
        username: username,
        password: password,
      );

      await _storage.write(
        key: StorageKeys.accessToken,
        value: accessToken.token,
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
  Future<void> logOut() async {
    await _storage.delete(
      key: StorageKeys.accessToken,
    );
  }

  @override
  Future<Result<void, Exception>> signUp({
    required String email,
    required String password,
  }) async {
    return Failure(Exception());
  }
}
