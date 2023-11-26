import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickstart_flutter_bloc/features/signup/presentation/bloc/signup_bloc.dart';
import 'package:quickstart_flutter_bloc/features/signup/presentation/signup_view.dart';

import '../test_helpers/pump_app.dart';

class MockSignupBloc extends MockBloc<SignupEvent, SignupState>
    implements SignupBloc {}

void main() {
  group('SignUpView', () {
    late SignupBloc signupBloc;

    setUp(() {
      signupBloc = MockSignupBloc();
      when(() => signupBloc.state).thenReturn(const SignupState());
    });

    testWidgets('renders view', (tester) async {
      await tester.pumpApp(
        BlocProvider.value(
          value: signupBloc,
          child: const SignUpView(),
        ),
      );

      expect(find.byType(SignUpView), findsOneWidget);
    });
  });
}
