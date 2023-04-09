import 'package:flutter/material.dart';
import 'package:flutter_bloc_starter/l10n/l10n.dart';
import 'package:flutter_bloc_starter/routes/app_routes.dart';
import 'package:flutter_bloc_starter/styling/app_spacing.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.signUp),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.large),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: context.l10n.email,
              ),
            ),
            const SizedBox(height: AppSpacing.medium),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: context.l10n.password,
              ),
            ),
            const SizedBox(height: AppSpacing.medium),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: context.l10n.confirmPassword,
              ),
            ),
            const SizedBox(height: AppSpacing.large),
            FilledButton(
              onPressed: () {
                context.go(AppPaths.home);
              },
              child: Text(context.l10n.signUp),
            ),
          ],
        ),
      ),
    );
  }
}
