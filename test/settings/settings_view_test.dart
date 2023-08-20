import 'package:flutter_bloc_starter/features/settings/settings_view.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helpers/pump_app.dart';

void main() {
  group('SettingsView', () {
    testWidgets('renders view', (tester) async {
      await tester.pumpApp(const SettingsView());
      await tester.pump();

      expect(find.byType(SettingsView), findsOneWidget);
    });
  });
}
