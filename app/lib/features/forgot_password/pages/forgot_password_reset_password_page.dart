import 'package:common_ui/styling/app_spacing.dart';
import 'package:common_ui/widgets/base_button.dart';
import 'package:common_ui/widgets/password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:quickstart_flutter_bloc/features/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';

class ForgotPasswordResetPasswordPage extends StatelessWidget {
  const ForgotPasswordResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.large),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _NewPasswordTextField(),
            Gap(AppSpacing.medium),
            _ConfirmPasswordTextField(),
            Gap(AppSpacing.large),
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
      label: context.l10n.forgotPassword.resetPageLabelNewPassword,
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
      label: context.l10n.forgotPassword.resetPageLabelConfirmPassword,
      textInputAction: TextInputAction.done,
      onSubmitted: (_) => context
          .read<ForgotPasswordBloc>()
          .add(const ForgotPasswordSubmitted()),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      text: context.l10n.forgotPassword.resetPageButtonSubmit,
      onPressed: () => context
          .read<ForgotPasswordBloc>()
          .add(const ForgotPasswordSubmitted()),
    );
  }
}
