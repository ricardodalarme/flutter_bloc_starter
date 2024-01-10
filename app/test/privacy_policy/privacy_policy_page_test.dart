import 'package:flutter_test/flutter_test.dart';
import 'package:quickstart_flutter_bloc/features/privacy_policy/privacy_policy_page.dart';

import '../test_helpers/pump_app.dart';

void main() {
  group('PrivacyPolicyPage', () {
    testWidgets('renders page', (tester) async {
      await tester.pumpApp(const PrivacyPolicyPage());
      await tester.pump();

      expect(find.byType(PrivacyPolicyPage), findsOneWidget);
    });
  });
}
