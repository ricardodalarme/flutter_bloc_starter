import 'package:flutter_bloc_starter/features/change_password/change_password_view.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helpers/pump_app.dart';

void main() {
  group('ChangePasswordView', () {
    testWidgets('renders view', (tester) async {
      await tester.pumpApp(const ChangePasswordView());
      await tester.pump();

      expect(find.byType(ChangePasswordView), findsOneWidget);
    });
  });
}
