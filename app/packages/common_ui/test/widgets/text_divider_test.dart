import 'package:common_ui/src/widgets/text_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helpers/pump_app.dart';

void main() {
  group('TextDivider', () {
    testWidgets('renders widget', (tester) async {
      await tester.pumpApp(
        const Material(child: TextDivider('Divider')),
      );
      await tester.pump();

      expect(find.byType(TextDivider), findsOneWidget);
    });

    testWidgets('renders text', (tester) async {
      await tester.pumpApp(
        const Material(child: TextDivider('Divider')),
      );
      await tester.pump();

      expect(find.text('Divider'), findsOneWidget);
    });

    testWidgets('renders dividers', (tester) async {
      await tester.pumpApp(
        const Material(child: TextDivider('Divider')),
      );
      await tester.pump();

      expect(find.byType(Divider), findsNWidgets(2));
    });
  });
}
