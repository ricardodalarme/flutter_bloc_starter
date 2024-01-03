import 'package:common/common.dart';
import 'package:quickstart_flutter_bloc/features/edit_profile/data/data_sources/edit_profile_data_source.dart';
import 'package:quickstart_flutter_bloc/features/edit_profile/domain/repositories/edit_profile_repository.dart';

class EditProfileRepositoryImpl implements EditProfileRepository {
  const EditProfileRepositoryImpl({
    required EditProfileDataSource editProfileDataSource,
  }) : _editProfileDataSource = editProfileDataSource;

  final EditProfileDataSource _editProfileDataSource;

  @override
  Future<Result<void, Exception>> updateProfile({
    required String firstName,
    required String lastName,
    required String email,
  }) async {
    try {
      await _editProfileDataSource.updateUser(
        firstName: firstName,
        lastName: lastName,
        email: email,
      );
      return const Success(null);
    } on Exception catch (exception) {
      return Failure(exception);
    }
  }
}
