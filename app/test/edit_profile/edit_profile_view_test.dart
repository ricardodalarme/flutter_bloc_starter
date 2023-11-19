import 'package:flutter_test/flutter_test.dart';
import 'package:quickstart_flutter_bloc/features/edit_profile/edit_profile_view.dart';

import '../test_helpers/pump_app.dart';

void main() {
  group('EditProfileView', () {
    testWidgets('renders view', (tester) async {
      await tester.pumpApp(const EditProfileView());
      await tester.pump();

      expect(find.byType(EditProfileView), findsOneWidget);
    });
  });
}
