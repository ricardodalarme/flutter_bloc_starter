import 'package:flutter/material.dart';
import 'package:flutter_bloc_starter/l10n/l10n.dart';
import 'package:flutter_bloc_starter/routes/app_routes.dart';
import 'package:flutter_bloc_starter/styling/app_spacing.dart';
import 'package:flutter_bloc_starter/widgets/password_text_field.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.login),
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
            PasswordTextField(
              labelText: context.l10n.password,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  context.push(AppPaths.forgotPassword);
                },
                child: Text(
                  context.l10n.forgotPassword,
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.large),
            FilledButton(
              onPressed: () {
                context.go(AppPaths.home);
              },
              child: Text(context.l10n.login),
            ),
            TextButton(
              onPressed: () async {
                await context.push(AppPaths.signup);
              },
              child: Text.rich(
                TextSpan(
                  text: context.l10n.dontHaveAnAccount,
                  children: [
                    TextSpan(
                      text: context.l10n.signUp,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
