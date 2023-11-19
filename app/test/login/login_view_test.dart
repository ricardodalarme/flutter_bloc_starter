import 'package:flutter_test/flutter_test.dart';
import 'package:quickstart_flutter_bloc/features/login/login_view.dart';

import '../test_helpers/pump_app.dart';

void main() {
  group('LoginView', () {
    testWidgets('renders view', (tester) async {
      await tester.pumpApp(const LoginView());
      await tester.pump();

      expect(find.byType(LoginView), findsOneWidget);
    });
  });
}
