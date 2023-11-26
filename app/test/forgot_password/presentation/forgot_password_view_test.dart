import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickstart_flutter_bloc/features/forgot_password/presentation/bloc/forgot_password_bloc.dart';
import 'package:quickstart_flutter_bloc/features/forgot_password/presentation/forgot_password_view.dart';

import '../../test_helpers/pump_app.dart';

class MockForgotPasswordBloc
    extends MockBloc<ForgotPasswordEvent, ForgotPasswordState>
    implements ForgotPasswordBloc {}

void main() {
  group('ForgotPasswordView', () {
    late ForgotPasswordBloc forgotPasswordBloc;

    setUp(() {
      forgotPasswordBloc = MockForgotPasswordBloc();
      when(() => forgotPasswordBloc.state)
          .thenReturn(const ForgotPasswordState());
    });

    testWidgets('renders view', (tester) async {
      await tester.pumpApp(
        BlocProvider.value(
          value: forgotPasswordBloc,
          child: const ForgotPasswordView(),
        ),
      );
      await tester.pump();

      expect(find.byType(ForgotPasswordView), findsOneWidget);
    });
  });
}
