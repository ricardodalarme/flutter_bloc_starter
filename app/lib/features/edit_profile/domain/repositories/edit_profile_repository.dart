import 'package:common/common.dart';

abstract class EditProfileRepository {
  Future<Result<void>> updateProfile({
    required String firstName,
    required String lastName,
    required String email,
  });
}
