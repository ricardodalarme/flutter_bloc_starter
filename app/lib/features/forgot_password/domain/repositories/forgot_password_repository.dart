import 'package:common/data/result.dart';

abstract class ForgotPasswordRepository {
  Future<Result<void, Exception>> forgotPassword({
    required String email,
  });
}
