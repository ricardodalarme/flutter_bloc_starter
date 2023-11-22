import 'package:common/data/result.dart';
import 'package:quickstart_flutter_bloc/features/change_password/domain/repositories/change_password_repository.dart';

class ChangePasswordRepositoryImpl implements ChangePasswordRepository {
  const ChangePasswordRepositoryImpl();

  @override
  Future<Result<void, Exception>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      return const Success(null);
    } on Exception catch (exception) {
      return Failure(exception);
    }
  }
}
