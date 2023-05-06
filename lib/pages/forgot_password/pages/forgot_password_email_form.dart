import 'package:flutter/material.dart';
import 'package:flutter_bloc_starter/l10n/l10n.dart';
import 'package:flutter_bloc_starter/styling/app_spacing.dart';

class ForgotPasswordEmailForm extends StatelessWidget {
  const ForgotPasswordEmailForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          context.l10n.forgotPasswordDescription,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: AppSpacing.xlarge),
        TextField(
          decoration: InputDecoration(
            labelText: context.l10n.email,
          ),
        ),
        const SizedBox(height: AppSpacing.large),
        FilledButton(
          onPressed: null,
          child: Text(context.l10n.send),
        ),
      ],
    );
  }
}
