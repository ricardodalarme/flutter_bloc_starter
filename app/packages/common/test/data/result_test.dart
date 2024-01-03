import 'package:common/common.dart';
import 'package:test/test.dart';

void main() {
  group('Result', () {
    test('Success equality', () {
      const success1 = Success<String, Exception>('value');
      const success2 = Success<String, Exception>('value');
      const success3 = Success<String, Exception>('different_value');

      expect(success1, equals(success2));
      expect(success1, isNot(equals(success3)));
    });

    test('Failure equality', () {
      final exception = Exception('error message');
      final failure1 = Failure<Exception>(exception);
      final failure2 = Failure<Exception>(exception);
      final failure3 = Failure<Exception>(Exception('different_message'));

      expect(failure1, equals(failure2));
      expect(failure1, isNot(equals(failure3)));
    });
  });
}
