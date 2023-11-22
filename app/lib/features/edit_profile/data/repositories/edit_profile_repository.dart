import 'package:common/data/result.dart';
import 'package:quickstart_flutter_bloc/features/edit_profile/domain/repositories/edit_profile_repository.dart';

class EditProfileRepositoryImpl implements EditProfileRepository {
  const EditProfileRepositoryImpl();

  @override
  Future<Result<void, Exception>> updateProfile({
    required String firstName,
    required String lastName,
    required String email,
  }) async {
    try {
      return const Success(null);
    } on Exception catch (exception) {
      return Failure(exception);
    }
  }
}
