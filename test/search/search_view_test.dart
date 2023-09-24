import 'package:flutter_bloc_starter/features/search/search_view.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helpers/pump_app.dart';

void main() {
  group('SearchView', () {
    testWidgets('renders view', (tester) async {
      await tester.pumpApp(const SearchView());
      await tester.pump();

      expect(find.byType(SearchView), findsOneWidget);
    });
  });
}
