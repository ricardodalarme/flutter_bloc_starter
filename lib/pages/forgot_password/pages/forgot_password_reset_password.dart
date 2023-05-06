import 'package:flutter/material.dart';
import 'package:flutter_bloc_starter/l10n/l10n.dart';
import 'package:flutter_bloc_starter/styling/app_spacing.dart';
import 'package:flutter_bloc_starter/widgets/password_text_field.dart';

class ForgotPasswordResetPasswordForm extends StatelessWidget {
  const ForgotPasswordResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PasswordTextField(
          labelText: context.l10n.newPassword,
        ),
        const SizedBox(height: AppSpacing.medium),
        PasswordTextField(
          labelText: context.l10n.confirmPassword,
        ),
        const SizedBox(height: AppSpacing.large),
        FilledButton(
          onPressed: null,
          child: Text(context.l10n.resetPassword),
        ),
      ],
    );
  }
}
