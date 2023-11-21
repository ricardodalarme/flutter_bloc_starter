import 'package:common/di/app_injector.dart';
import 'package:common/di/injector.dart';
import 'package:test/test.dart';

void main() {
  group('AppInjector', () {
    late Injector appInjector;

    setUp(() {
      appInjector = AppInjector.instance;
    });

    test('Register and get singleton', () {
      appInjector.registerSingleton<String>('TestString', instanceName: 'test');
      final result = appInjector.get<String>(instanceName: 'test');
      expect(result, 'TestString');
    });

    test('Register and get lazy singleton', () {
      appInjector.registerLazySingleton<String>(
        () => 'LazyTestString',
        instanceName: 'lazyTest',
      );
      final result = appInjector.get<String>(instanceName: 'lazyTest');
      expect(result, 'LazyTestString');
    });

    test('Register and get factory', () {
      appInjector.registerFactory<int>(() => 42, instanceName: 'testFactory');
      final result = appInjector.get<int>(instanceName: 'testFactory');
      expect(result, 42);
    });

    test('Unregister instance', () {
      appInjector.registerSingleton<int>(42, instanceName: 'testUnregister');
      appInjector.unregister<int>(instanceName: 'testUnregister');
      expect(
        () => appInjector.get<int>(instanceName: 'testUnregister'),
        throwsStateError,
      );
    });
  });
}
