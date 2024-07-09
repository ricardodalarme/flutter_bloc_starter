abstract class PersistentStorageService {
  Future<String?> read({required String key});
  Future<void> write({required String key, required String value});
  Future<void> delete({required String key});
  Future<void> clear();
}

class PersistentStorageServiceImpl implements PersistentStorageService {
  const PersistentStorageServiceImpl();

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
