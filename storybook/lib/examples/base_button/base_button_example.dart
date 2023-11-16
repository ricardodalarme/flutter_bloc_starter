import 'package:common_ui/widgets/base_button.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode buttonExample = WidgetbookUseCase(
  name: 'BaseButton',
  builder: (context) => BaseButton(
    text: context.knobs.string(
      label: 'Text',
      initialValue: 'Example',
    ),
    isEnabled: context.knobs.boolean(
      label: 'Enabled',
      initialValue: true,
    ),
    isLoading: context.knobs.boolean(
      label: 'Loading',
    ),
    onPressed: () => _onPressed(context),
  ),
);

void _onPressed(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Click success'),
    ),
  );
}
