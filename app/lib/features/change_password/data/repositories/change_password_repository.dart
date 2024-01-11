import 'package:common/common.dart';
import 'package:quickstart_flutter_bloc/features/change_password/data/data_sources/change_password_data_source.dart';
import 'package:quickstart_flutter_bloc/features/change_password/domain/repositories/change_password_repository.dart';

class ChangePasswordRepositoryImpl implements ChangePasswordRepository {
  const ChangePasswordRepositoryImpl({
    required ChangePasswordDataSource changePasswordDataSource,
  }) : _changePasswordDataSource = changePasswordDataSource;

  final ChangePasswordDataSource _changePasswordDataSource;

  @override
  Future<Result<void>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      await _changePasswordDataSource.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      return const Success(null);
    } on Exception catch (exception) {
      return Failure(exception);
    }
  }
}
