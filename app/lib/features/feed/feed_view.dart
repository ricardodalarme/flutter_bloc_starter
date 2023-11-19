import 'package:common_ui/styling/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';

class FeedView extends StatelessWidget {
  const FeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.feed.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.medium),
        child: Center(
          child: Text(context.l10n.feed.title),
        ),
      ),
    );
  }
}
