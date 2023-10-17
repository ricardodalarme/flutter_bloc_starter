import 'package:flutter_test/flutter_test.dart';
import 'package:quickstart_flutter_bloc/features/home/home_view.dart';

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
