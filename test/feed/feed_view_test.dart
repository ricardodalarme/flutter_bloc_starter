import 'package:flutter_bloc_starter/features/feed/feed_view.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helpers/pump_app.dart';

void main() {
  group('FeedView', () {
    testWidgets('renders view', (tester) async {
      await tester.pumpApp(const FeedView());
      await tester.pump();

      expect(find.byType(FeedView), findsOneWidget);
    });
  });
}
