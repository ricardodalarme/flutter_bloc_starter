import 'package:flutter_bloc_starter/features/settings/presentation/settings_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_helpers/pump_app.dart';

void main() {
  group('SettingsPage', () {
    testWidgets('renders page', (tester) async {
      await tester.pumpApp(const SettingsPage());
      await tester.pump();

      expect(find.byType(SettingsPage), findsOneWidget);
    });
  });
}
