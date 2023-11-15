import 'package:common_ui/widgets/sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode signInButtonExample = WidgetbookUseCase(
  name: 'SignInButton',
  builder: (context) => SignInButton(
    context.knobs.list(
      label: 'Provider',
      options: ButtonProvider.values,
    ),
    text: (provider) =>
        'Sign in with ${provider.name.characters.first.toUpperCase() + provider.name.substring(1)}',
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
