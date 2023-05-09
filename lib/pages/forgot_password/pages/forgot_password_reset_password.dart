import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/blocs/forgot_password/forgot_password_bloc.dart';
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
        const _NewPasswordTextField(),
        const SizedBox(height: AppSpacing.medium),
        const _ConfirmPasswordTextField(),
        const SizedBox(height: AppSpacing.large),
        FilledButton(
          onPressed: null,
          child: Text(context.l10n.resetPassword),
        ),
      ],
    );
  }
}

class _NewPasswordTextField extends StatelessWidget {
  const _NewPasswordTextField();

  @override
  Widget build(BuildContext context) {
    return PasswordTextField(
      onChanged: (value) => context
          .read<ForgotPasswordBloc>()
          .add(ForgotPasswordNewPasswordChanged(value)),
      labelText: context.l10n.newPassword,
    );
  }
}

class _ConfirmPasswordTextField extends StatelessWidget {
  const _ConfirmPasswordTextField();

  @override
  Widget build(BuildContext context) {
    return PasswordTextField(
      onChanged: (value) => context
          .read<ForgotPasswordBloc>()
          .add(ForgotPasswordConfirmPasswordChanged(value)),
      labelText: context.l10n.confirmPassword,
    );
  }
}
