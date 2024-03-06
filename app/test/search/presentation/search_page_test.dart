import 'package:flutter_test/flutter_test.dart';
import 'package:quickstart_flutter_bloc/features/search/presentation/search_page.dart';

import '../../test_helpers/pump_app.dart';

void main() {
  group('SearchPage', () {
    testWidgets('renders page', (tester) async {
      await tester.pumpApp(const SearchPage());
      await tester.pump();

      expect(find.byType(SearchPage), findsOneWidget);
    });
  });
}
