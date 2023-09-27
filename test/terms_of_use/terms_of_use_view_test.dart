import 'package:flutter_bloc_starter/features/terms_of_use/terms_of_use_view.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helpers/pump_app.dart';

void main() {
  group('TermsOfUseView', () {
    testWidgets('renders view', (tester) async {
      await tester.pumpApp(const TermsOfUseView());
      await tester.pump();

      expect(find.byType(TermsOfUseView), findsOneWidget);
    });
  });
}
