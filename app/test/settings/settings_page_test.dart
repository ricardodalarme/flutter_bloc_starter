import 'package:flutter_test/flutter_test.dart';
import 'package:quickstart_flutter_bloc/features/settings/settings_page.dart';

import '../test_helpers/pump_app.dart';

void main() {
  group('SettingsPage', () {
    testWidgets('renders page', (tester) async {
      await tester.pumpApp(const SettingsPage());
      await tester.pump();

      expect(find.byType(SettingsPage), findsOneWidget);
    });
  });
}
