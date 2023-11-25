import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:formz_inputs/formz_inputs.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickstart_flutter_bloc/features/login/domain/repositories/change_password_repository.dart';
import 'package:quickstart_flutter_bloc/features/login/presentation/bloc/login_bloc.dart';

class MockLoginRepository extends Mock implements LoginRepository {}

void main() {
  group('LoginBloc', () {
    late LoginRepository loginRepository;
    late LoginBloc loginBloc;

    setUp(() {
      loginRepository = MockLoginRepository();
      loginBloc = LoginBloc(loginRepository: loginRepository);
    });

    tearDown(() {
      loginBloc.close();
    });

    test('initial state is correct', () {
      expect(
        loginBloc.state,
        const LoginState(
          // ignore: avoid_redundant_argument_values
          username: NonEmptyInput.pure(),
          // ignore: avoid_redundant_argument_values
          password: NonEmptyInput.pure(),
          // ignore: avoid_redundant_argument_values
          status: FormzSubmissionStatus.initial,
        ),
      );
    });

    blocTest<LoginBloc, LoginState>(
      'emits [LoginState] when [LoginUsernameChanged] is added',
      build: () => loginBloc,
      act: (bloc) => bloc.add(const LoginUsernameChanged('john')),
      expect: () => [const LoginState(username: NonEmptyInput.dirty('john'))],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [LoginState] when [LoginPasswordChanged] is added',
      build: () => loginBloc,
      act: (bloc) => bloc.add(const LoginPasswordChanged('password')),
      expect: () =>
          [const LoginState(password: NonEmptyInput.dirty('password'))],
    );
  });
}
