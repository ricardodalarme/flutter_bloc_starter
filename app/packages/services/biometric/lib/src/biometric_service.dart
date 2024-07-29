import 'package:local_auth/local_auth.dart';

abstract class BiometricService {
  Future<bool> authenticate(String reason);
  Future<bool> isDeviceSupported();
}

class BiometricServiceImpl implements BiometricService {
  factory BiometricServiceImpl([LocalAuthentication? localAuthentication]) {
    return BiometricServiceImpl._(
      localAuthentication ?? LocalAuthentication(),
    );
  }

  const BiometricServiceImpl._(this._localAuthentication);

  final LocalAuthentication _localAuthentication;

  @override
  Future<bool> authenticate(
    String reason, {
    bool stickyAuth = true,
    bool biometricOnly = true,
  }) async {
    return _localAuthentication.authenticate(
      localizedReason: reason,
      options: AuthenticationOptions(
        biometricOnly: biometricOnly,
        stickyAuth: stickyAuth,
      ),
    );
  }

  @override
  Future<bool> isDeviceSupported() async {
    return _localAuthentication.isDeviceSupported();
  }
}
