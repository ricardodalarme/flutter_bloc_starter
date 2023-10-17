import 'package:flutter/material.dart';
import 'package:quickstart_flutter_bloc/styling/app_spacing.dart';

class TextDivider extends StatelessWidget {
  const TextDivider(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.medium,
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        Expanded(
          child: Divider(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
