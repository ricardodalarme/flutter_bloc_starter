import 'package:flutter_bloc_starter/features/term/presentation/terms_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_helpers/pump_app.dart';

void main() {
  group('TermsPage', () {
    testWidgets('renders page', (tester) async {
      await tester.pumpApp(const TermsPage());
      await tester.pump();

      expect(find.byType(TermsPage), findsOneWidget);
    });
  });
}
