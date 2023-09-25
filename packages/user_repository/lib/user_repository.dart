library user_repository;

class UserRepository {
  Future<void> changePassword(
    String currentPassword,
    String newPassword,
  ) async {}

  Future<void> updateProfile({
    required String firstName,
    required String lastName,
    required String email,
  }) async {}
}
