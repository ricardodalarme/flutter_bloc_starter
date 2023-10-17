import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickstart_flutter_bloc/l10n/l10n.dart';
import 'package:quickstart_flutter_bloc/routes/app_routes.dart';
import 'package:quickstart_flutter_bloc/styling/app_spacing.dart';
import 'package:quickstart_flutter_bloc/widgets/base_button.dart';

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
            BaseButton(
              text: context.l10n.goBackHome,
              onPressed: () => context.go(AppPaths.home),
            ),
          ],
        ),
      ),
    );
  }
}
