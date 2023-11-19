import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickstart_flutter_bloc/features/change_password/bloc/change_password_bloc.dart';
import 'package:quickstart_flutter_bloc/features/change_password/change_password_view.dart';

import '../test_helpers/pump_app.dart';

class MockChangePasswordBloc
    extends MockBloc<ChangePasswordEvent, ChangePasswordState>
    implements ChangePasswordBloc {}

void main() {
  group('ChangePasswordView', () {
    late ChangePasswordBloc changePasswordBloc;

    setUp(() {
      changePasswordBloc = MockChangePasswordBloc();
      when(() => changePasswordBloc.state)
          .thenReturn(const ChangePasswordState());
    });

    testWidgets('renders view', (tester) async {
      await tester.pumpApp(
        BlocProvider.value(
          value: changePasswordBloc,
          child: const ChangePasswordView(),
        ),
      );
      await tester.pump();

      expect(find.byType(ChangePasswordView), findsOneWidget);
    });
  });
}
