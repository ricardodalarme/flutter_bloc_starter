import 'package:common_ui/common_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode errorIndicatorExample = WidgetbookUseCase(
  name: 'ErrorIndicator',
  builder: (context) => ErrorIndicator(
    title: 'Something went wrong',
    message: 'Please try again later',
    buttonText: 'Retry',
    onButtonPressed: () => _onPressed(context),
  ),
);

void _onPressed(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Click success'),
    ),
  );
}
