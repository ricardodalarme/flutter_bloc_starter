import 'package:flutter_test/flutter_test.dart';
import 'package:quickstart_flutter_bloc/features/profile/profile_view.dart';

import '../test_helpers/pump_app.dart';

void main() {
  group('ProfileView', () {
    testWidgets('renders view', (tester) async {
      await tester.pumpApp(const ProfileView());
      await tester.pump();

      expect(find.byType(ProfileView), findsOneWidget);
    });
  });
}
