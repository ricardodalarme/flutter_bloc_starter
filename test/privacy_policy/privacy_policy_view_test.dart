import 'package:flutter_test/flutter_test.dart';
import 'package:quickstart_flutter_bloc/features/privacy_policy/privacy_policy_view.dart';

import '../test_helpers/pump_app.dart';

void main() {
  group('PrivacyPolicyView', () {
    testWidgets('renders view', (tester) async {
      await tester.pumpApp(const PrivacyPolicyView());
      await tester.pump();

      expect(find.byType(PrivacyPolicyView), findsOneWidget);
    });
  });
}
