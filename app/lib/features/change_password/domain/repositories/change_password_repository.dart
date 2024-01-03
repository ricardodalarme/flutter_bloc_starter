import 'package:common/common.dart';

abstract class ChangePasswordRepository {
  Future<Result<void, Exception>> changePassword({
    required String currentPassword,
    required String newPassword,
  });
}
