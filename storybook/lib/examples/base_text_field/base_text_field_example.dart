import 'package:common_ui/widgets/base_text_field.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode baseTextFieldExample = WidgetbookUseCase(
  name: 'BaseTextField',
  builder: (context) => BaseTextField(
    label: context.knobs.string(
      label: 'Label',
      initialValue: 'Label',
    ),
    autocorrect: context.knobs.boolean(
      label: 'Autocorrect',
      initialValue: true,
    ),
    enableSuggestions: context.knobs.boolean(
      label: 'Enable suggestions',
      initialValue: true,
    ),
    obscureText: context.knobs.boolean(
      label: 'Obscure text',
    ),
    textInputAction: context.knobs.listOrNull(
      label: 'Text input action',
      options: TextInputAction.values,
    ),
    keyboardType: context.knobs.listOrNull(
      label: 'Keyboard type',
      options: TextInputType.values,
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
