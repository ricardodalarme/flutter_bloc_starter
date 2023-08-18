import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:flutter_bloc_starter/l10n/l10n.dart';
import 'package:flutter_bloc_starter/styling/app_spacing.dart';
import 'package:flutter_bloc_starter/widgets/password_text_field.dart';

class ForgotPasswordResetPasswordForm extends StatelessWidget {
  const ForgotPasswordResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.large),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _NewPasswordTextField(),
            SizedBox(height: AppSpacing.medium),
            _ConfirmPasswordTextField(),
            SizedBox(height: AppSpacing.large),
            _SubmitButton(),
          ],
        ),
      ),
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
      textInputAction: TextInputAction.next,
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
      textInputAction: TextInputAction.done,
      onSubmitted: (_) =>
          context.read<ForgotPasswordBloc>().add(ForgotPasswordSubmitted()),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () =>
          context.read<ForgotPasswordBloc>().add(ForgotPasswordSubmitted()),
      child: Text(context.l10n.resetPassword),
    );
  }
}
