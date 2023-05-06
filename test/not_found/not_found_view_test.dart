import 'package:flutter_bloc_starter/pages/not_found/not_found_view.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helpers/pump_app.dart';

void main() {
  group('NotFoundView', () {
    testWidgets('renders view', (tester) async {
      await tester.pumpApp(const NotFoundView());
      await tester.pump();

      expect(find.byType(NotFoundView), findsOneWidget);
    });
  });
}
