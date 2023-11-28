import 'package:common_ui/widgets/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helpers/pump_app.dart';

void main() {
  group('ProfilePicture', () {
    const size = 100.0;

    testWidgets('renders widget when photoUrl is null', (tester) async {
      await tester.pumpApp(
        const Material(
          child: ProfilePicture(
            photoUrl: null,
            size: size,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ProfilePicture), findsOneWidget);
    });

    testWidgets('renders widget when photoUrl is not null', (tester) async {
      await tester.pumpApp(
        const Material(
          child: ProfilePicture(
            photoUrl: 'https://picsum.photos/200',
            size: size,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ProfilePicture), findsOneWidget);
    });

    testWidgets('show fallback avatar when photoUrl is unreachable',
        (tester) async {
      await tester.pumpApp(
        const Material(
          child: ProfilePicture(
            photoUrl: 'https://non.existing.url/200',
            size: size,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ProfilePicture), findsOneWidget);
    });
  });
}
