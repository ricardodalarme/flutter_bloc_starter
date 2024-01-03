import 'package:common/common.dart';
import 'package:quickstart_flutter_bloc/features/login/data/data_sources/login_data_source.dart';
import 'package:quickstart_flutter_bloc/features/login/domain/repositories/change_password_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  const LoginRepositoryImpl({
    required LoginDataSource loginDataSource,
  }) : _loginDataSource = loginDataSource;

  final LoginDataSource _loginDataSource;

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
}
