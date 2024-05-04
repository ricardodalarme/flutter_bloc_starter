import 'package:storage_service/storage_service.dart';

class PersistentStorageService implements StorageService {
  const PersistentStorageService();

  @override
  Future<String?> read({required String key}) async {
    throw UnimplementedError();
  }

  @override
  Future<void> write({required String key, required String value}) async {
    throw UnimplementedError();
  }

  @override
  Future<void> delete({required String key}) async {
    throw UnimplementedError();
  }

  @override
  Future<void> clear() async {
    throw UnimplementedError();
  }
}
