import 'package:flutter_test/flutter_test.dart';
import 'package:quickstart_flutter_bloc/features/signup/signup_view.dart';

import '../test_helpers/pump_app.dart';

void main() {
  group('SignUpView', () {
    testWidgets('renders view', (tester) async {
      await tester.pumpApp(const SignUpView());
      await tester.pump();

      expect(find.byType(SignUpView), findsOneWidget);
    });
  });
}
