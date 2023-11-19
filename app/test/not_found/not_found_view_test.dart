import 'package:flutter_test/flutter_test.dart';
import 'package:quickstart_flutter_bloc/features/not_found/not_found_view.dart';

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
