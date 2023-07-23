import 'package:flutter/material.dart';
import 'package:flutter_bloc_starter/l10n/l10n.dart';
import 'package:flutter_bloc_starter/routes/app_routes.dart';
import 'package:flutter_bloc_starter/styling/app_spacing.dart';
import 'package:go_router/go_router.dart';

class NotFoundView extends StatelessWidget {
  const NotFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.l10n.error404,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Text(
              context.l10n.pageNotFound,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: AppSpacing.xxlarge),
            FilledButton(
              child: Text(context.l10n.goBackHome),
              onPressed: () => context.go(AppPaths.home),
            ),
          ],
        ),
      ),
    );
  }
}
