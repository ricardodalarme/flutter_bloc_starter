import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';
import 'package:quickstart_flutter_bloc/routes/app_router.dart';

@RoutePage()
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
              context.l10n.notFound.title,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Text(
              context.l10n.notFound.description,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Gap(AppSpacing.xxlarge),
            BaseButton(
              text: context.l10n.notFound.buttonBack,
              onPressed: () => context.navigateTo(const HomeRoute()),
            ),
          ],
        ),
      ),
    );
  }
}
