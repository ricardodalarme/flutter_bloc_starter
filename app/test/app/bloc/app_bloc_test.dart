import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickstart_flutter_bloc/features/app/bloc/app_bloc.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  group('AppBloc', () {
    late AppBloc appBloc;
    late AuthenticationRepository mockAuthRepository;

    setUp(() {
      mockAuthRepository = MockAuthenticationRepository();
      when(() => mockAuthRepository.logOut()).thenAnswer((_) async {});

      appBloc = AppBloc(authenticationRepository: mockAuthRepository);
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
        verify(() => mockAuthRepository.logOut()).called(1);
      },
    );
  });
}
