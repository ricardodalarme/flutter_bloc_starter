import 'package:common/common.dart';

abstract class ForgotPasswordRepository {
  Future<Result<void>> forgotPassword({
    required String email,
  });
}
