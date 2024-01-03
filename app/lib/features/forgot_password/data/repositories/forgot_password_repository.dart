import 'package:common/common.dart';
import 'package:quickstart_flutter_bloc/features/forgot_password/data/data_sources/forgot_data_source.dart';
import 'package:quickstart_flutter_bloc/features/forgot_password/domain/repositories/forgot_password_repository.dart';

class ForgotPasswordRepositoryImpl implements ForgotPasswordRepository {
  const ForgotPasswordRepositoryImpl({
    required ForgotPasswordDataSource forgotPasswordDataSource,
  }) : _forgotPasswordDataSource = forgotPasswordDataSource;

  final ForgotPasswordDataSource _forgotPasswordDataSource;

  @override
  Future<Result<void, Exception>> forgotPassword({
    required String email,
  }) async {
    try {
      await _forgotPasswordDataSource.forgotPassword(
        email: email,
      );
      return const Success(null);
    } on Exception catch (exception) {
      return Failure(exception);
    }
  }
}
