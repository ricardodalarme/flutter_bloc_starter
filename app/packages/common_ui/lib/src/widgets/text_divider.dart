import 'package:common_ui/common_ui.dart';
import 'package:flutter/material.dart' show Divider;

class TextDivider extends StatelessWidget {
  const TextDivider(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: context.colors.onSurface,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.medium,
          ),
          child: Text(
            text,
            style: context.typography.bodySmall,
          ),
        ),
        Expanded(
          child: Divider(
            color: context.colors.onSurface,
          ),
        ),
      ],
    );
  }
}
