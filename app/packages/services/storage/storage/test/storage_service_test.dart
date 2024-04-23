import 'package:storage_service/storage_service.dart';
import 'package:test/fake.dart';
import 'package:test/test.dart';

class FakeStorage extends Fake implements StorageService {}

void main() {
  test('Storage can be implemented', () {
    expect(FakeStorage.new, returnsNormally);
  });

  test('exports StorageException', () {
    expect(() => const StorageException('oops'), returnsNormally);
  });
}
