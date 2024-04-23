import 'dart:async';

import 'package:quickstart_flutter_bloc/features/authentication/data/data_sources/authentication_data_source.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/data_sources/models/token_local.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/data_sources/token_local_data_source.dart';
import 'package:quickstart_flutter_bloc/features/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  AuthenticationRepositoryImpl({
    required AuthenticationDataSource loginDataSource,
    required TokenLocalDataSource tokenLocalDataSource,
  })  : _loginDataSource = loginDataSource,
        _tokenLocalDataSource = tokenLocalDataSource {
    _authenticationStreamController = StreamController<bool>.broadcast();
  }

  final AuthenticationDataSource _loginDataSource;
  final TokenLocalDataSource _tokenLocalDataSource;
  late final StreamController<bool> _authenticationStreamController;

  @override
  Stream<bool> get isAuthenticated => _authenticationStreamController.stream;

  @override
  void dispose() {
    _authenticationStreamController.close();
  }

  @override
  Future<void> logInWithUsernameAndPassword({
    required String username,
    required String password,
  }) async {
    try {
      final (accessToken, _) =
          await _loginDataSource.logInWithUsernameAndPassword(
        username: username,
        password: password,
      );

      await _tokenLocalDataSource.save(
        TokenLocal(expires: accessToken.expires, token: accessToken.token),
      );

      _authenticationStreamController.add(true);
    } catch (_) {
      _authenticationStreamController.add(false);
      await _tokenLocalDataSource.delete();
      rethrow;
    }
  }

  @override
  Future<void> logInWithGoogle() async {
    throw UnimplementedError();
  }

  @override
  Future<void> logInWithFacebook() async {
    throw UnimplementedError();
  }

  @override
  Future<void> logOut() async {
    _authenticationStreamController.add(false);
    await _tokenLocalDataSource.delete();
  }
}
