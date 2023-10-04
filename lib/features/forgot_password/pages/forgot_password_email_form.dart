import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:flutter_bloc_starter/l10n/l10n.dart';
import 'package:flutter_bloc_starter/styling/app_spacing.dart';
import 'package:flutter_bloc_starter/widgets/base_button.dart';
import 'package:flutter_bloc_starter/widgets/base_text_field.dart';

class ForgotPasswordEmailForm extends StatelessWidget {
  const ForgotPasswordEmailForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.large),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.l10n.forgotPasswordDescription,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: AppSpacing.xlarge),
            const _EmailTextField(),
            const SizedBox(height: AppSpacing.large),
            const _SendEmailButton(),
          ],
        ),
      ),
    );
  }
}

class _EmailTextField extends StatelessWidget {
  const _EmailTextField();

  @override
  Widget build(BuildContext context) {
    return BaseTextField(
      onChanged: (value) => context
          .read<ForgotPasswordBloc>()
          .add(ForgotPasswordEmailChanged(value)),
      decoration: InputDecoration(
        labelText: context.l10n.email,
      ),
    );
  }
}

class _SendEmailButton extends StatelessWidget {
  const _SendEmailButton();

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      text: context.l10n.send,
      onPressed: () => context
          .read<ForgotPasswordBloc>()
          .add(ForgotPasswordSendEmailPressed()),
    );
  }
}
