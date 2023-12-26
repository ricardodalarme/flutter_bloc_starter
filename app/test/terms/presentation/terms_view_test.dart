import 'package:flutter_test/flutter_test.dart';
import 'package:quickstart_flutter_bloc/features/terms/presentation/terms_view.dart';

import '../../test_helpers/pump_app.dart';

void main() {
  group('TermsView', () {
    testWidgets('renders view', (tester) async {
      await tester.pumpApp(const TermsView());
      await tester.pump();

      expect(find.byType(TermsView), findsOneWidget);
    });
  });
}
