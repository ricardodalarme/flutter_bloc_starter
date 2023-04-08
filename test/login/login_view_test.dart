import 'package:flutter_bloc_starter/pages/login/login_view.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helpers/pump_app.dart';

void main() {
  group('Login', () {
    testWidgets('renders LoginView', (tester) async {
      await tester.pumpApp(const LoginView());
      await tester.pump();

      expect(find.byType(LoginView), findsOneWidget);
    });
  });
}
