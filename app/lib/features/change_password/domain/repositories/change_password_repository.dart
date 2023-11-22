import 'package:common/data/result.dart';

abstract class ChangePasswordRepository {
  Future<Result<void, Exception>> changePassword({
    required String currentPassword,
    required String newPassword,
  });
}
