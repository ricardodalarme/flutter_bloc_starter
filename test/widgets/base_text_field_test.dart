import 'package:flutter/material.dart';
import 'package:flutter_bloc_starter/widgets/base_text_field.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helpers/pump_app.dart';

void main() {
  group('BaseTextField', () {
    testWidgets('renders widget', (tester) async {
      await tester.pumpApp(
        const Material(child: BaseTextField()),
      );
      await tester.pump();

      expect(find.byType(BaseTextField), findsOneWidget);
    });
  });
}
