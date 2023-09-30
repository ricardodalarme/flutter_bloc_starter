import 'package:user_repository/src/exceptions.dart';

class UserRepository {
  Future<void> changePassword(
    String currentPassword,
    String newPassword,
  ) async {
    try {
      // TODO: implement changePassword
    } catch (e) {
      throw ChangePasswordException();
    }
  }

  Future<void> updateProfile({
    required String firstName,
    required String lastName,
    required String email,
  }) async {
    try {
      // TODO: implement updateProfile
    } catch (e) {
      throw UpdateProfileException();
    }
  }
}
