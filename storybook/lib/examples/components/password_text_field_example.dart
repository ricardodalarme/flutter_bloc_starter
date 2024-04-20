import 'package:common_ui/common_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode passwordTextFieldExample = WidgetbookUseCase(
  name: 'PasswordTextField',
  builder: (context) => PasswordTextField(
    text: context.knobs.string(
      label: 'Text',
    ),
    label: context.knobs.string(
      label: 'Label',
      initialValue: 'Password',
    ),
    textInputAction: context.knobs.listOrNull(
      label: 'Text input action',
      options: TextInputAction.values,
    ),
    onSubmitted: (value) => _onSubmitted(context, value),
  ),
);

void _onSubmitted(BuildContext context, String value) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Submitted "$value"'),
    ),
  );
}
