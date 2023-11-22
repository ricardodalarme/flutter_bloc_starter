import 'package:common/data/result.dart';

abstract class EditProfileRepository {
  Future<Result<void, Exception>> updateProfile({
    required String firstName,
    required String lastName,
    required String email,
  });
}
