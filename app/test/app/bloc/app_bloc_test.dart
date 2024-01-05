import 'package:bloc_test/bloc_test.dart';
import 'package:common/common.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickstart_flutter_bloc/features/app/bloc/app_bloc.dart';
import 'package:quickstart_flutter_bloc/features/authentication/domain/repositories/authentication_repository.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  group('AppBloc', () {
    late AppBloc appBloc;
    late AuthenticationRepository mockAuthenticationRepository;

    setUp(() {
      mockAuthenticationRepository = MockAuthenticationRepository();
      when(() => mockAuthenticationRepository.logOut())
          .thenAnswer((_) async => const Success(null));

      appBloc = AppBloc(authenticationRepository: mockAuthenticationRepository);
    });

    tearDown(() {
      appBloc.close();
    });

    test('initial state is AppState.unauthenticated()', () {
      expect(appBloc.state, equals(const AppState.unauthenticated()));
    });

    blocTest<AppBloc, AppState>(
      'authenticationRepository.logOut() is called when AppLogoutRequested is added.',
      build: () => appBloc,
      act: (bloc) => bloc.add(const AppLogoutRequested()),
      verify: (_) {
        verify(() => mockAuthenticationRepository.logOut()).called(1);
      },
    );
  });
}
