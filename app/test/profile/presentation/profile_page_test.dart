import 'package:flutter_bloc_starter/features/profile/presentation/profile_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_helpers/pump_app.dart';

void main() {
  group('ProfilePage', () {
    testWidgets('renders page', (tester) async {
      await tester.pumpApp(const ProfilePage());
      await tester.pump();

      expect(find.byType(ProfilePage), findsOneWidget);
    });
  });
}
