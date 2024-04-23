import 'dart:async';

import 'package:common/common.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/data_sources/authentication_data_source.dart';
import 'package:quickstart_flutter_bloc/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:storage_service/storage_service.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  AuthenticationRepositoryImpl({
    required AuthenticationDataSource loginDataSource,
    required StorageService storage,
  })  : _loginDataSource = loginDataSource,
        _storage = storage {
    _authenticationStreamController = StreamController<bool>.broadcast();
  }

  final AuthenticationDataSource _loginDataSource;
  final StorageService _storage;
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

      await _storage.write(
        key: StorageKeys.accessToken,
        value: accessToken.token,
      );

      _authenticationStreamController.add(true);
    } catch (_) {
      _authenticationStreamController.add(false);
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
    await _storage.delete(
      key: StorageKeys.accessToken,
    );
  }
}
