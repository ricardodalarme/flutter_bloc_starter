import 'package:flutter_bloc_starter/features/home/home_view.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helpers/pump_app.dart';

void main() {
  group('HomeView', () {
    testWidgets('renders view', (tester) async {
      await tester.pumpApp(const HomeView());
      await tester.pump();

      expect(find.byType(HomeView), findsOneWidget);
    });
  });
}
