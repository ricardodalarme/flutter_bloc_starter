import 'package:flutter_test/flutter_test.dart';
import 'package:quickstart_flutter_bloc/features/post/presentation/post_page.dart';

import '../../test_helpers/pump_app.dart';

void main() {
  group('PostPage', () {
    testWidgets('renders page', (tester) async {
      await tester.pumpApp(
        const PostPage(),
      );
      await tester.pump();

      expect(find.byType(PostPage), findsOneWidget);
    });
  });
}
