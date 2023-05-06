import 'package:flutter/material.dart';
import 'package:flutter_bloc_starter/l10n/l10n.dart';
import 'package:flutter_bloc_starter/routes/app_routes.dart';
import 'package:flutter_bloc_starter/styling/app_spacing.dart';
import 'package:flutter_bloc_starter/widgets/password_text_field.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.changePassword),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.large),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PasswordTextField(
              labelText: context.l10n.currentPassword,
            ),
            const SizedBox(height: AppSpacing.medium),
            PasswordTextField(
              labelText: context.l10n.newPassword,
            ),
            const SizedBox(height: AppSpacing.medium),
            PasswordTextField(
              labelText: context.l10n.confirmPassword,
            ),
            const SizedBox(height: AppSpacing.large),
            FilledButton(
              onPressed: () {
                context.go(AppPaths.home);
              },
              child: Text(context.l10n.save),
            ),
          ],
        ),
      ),
    );
  }
}
