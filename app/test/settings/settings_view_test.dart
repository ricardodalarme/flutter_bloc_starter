import 'package:flutter_test/flutter_test.dart';
import 'package:quickstart_flutter_bloc/features/settings/settings_view.dart';

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
