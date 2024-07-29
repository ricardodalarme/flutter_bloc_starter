import 'package:common_ui/common_ui.dart';
import 'package:flutter_bloc_starter/features/post/domain/models/post_model.dart';
import 'package:flutter_bloc_starter/features/post/presentation/widgets/post_card.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_helpers/pump_app.dart';

void main() {
  group('PostCard', () {
    testWidgets('PostCard should display correct information',
        (WidgetTester tester) async {
      const post = PostModel(
        id: '1',
        title: 'Test Title',
        body: 'Test Body',
      );

      await tester.pumpApp(
        const PostCard(post: post),
      );

      expect(find.byType(ProfilePicture), findsOneWidget);

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Body'), findsOneWidget);
    });
  });
}
