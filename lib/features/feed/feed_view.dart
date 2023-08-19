import 'package:flutter/material.dart';
import 'package:flutter_bloc_starter/l10n/l10n.dart';
import 'package:flutter_bloc_starter/styling/app_spacing.dart';

class FeedView extends StatelessWidget {
  const FeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.feed),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.medium),
        child: Center(
          child: Text(context.l10n.feed),
        ),
      ),
    );
  }
}
