import 'package:common_ui/src/widgets/base_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helpers/pump_app.dart';

void main() {
  group('BaseButton', () {
    testWidgets('renders widget', (tester) async {
      await tester.pumpApp(
        Material(child: BaseButton(text: 'Example', onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(BaseButton), findsOneWidget);
    });
  });
}
