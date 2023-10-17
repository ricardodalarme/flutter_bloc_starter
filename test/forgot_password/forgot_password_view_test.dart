import 'package:flutter_test/flutter_test.dart';
import 'package:quickstart_flutter_bloc/features/forgot_password/forgot_password_view.dart';

import '../test_helpers/pump_app.dart';

void main() {
  group('ForgotPasswordView', () {
    testWidgets('renders view', (tester) async {
      await tester.pumpApp(const ForgotPasswordView());
      await tester.pump();

      expect(find.byType(ForgotPasswordView), findsOneWidget);
    });
  });
}
