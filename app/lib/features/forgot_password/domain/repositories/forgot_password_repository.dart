import 'package:common/common.dart';

abstract class ForgotPasswordRepository {
  Future<Result<void, Exception>> forgotPassword({
    required String email,
  });
}
