import 'package:common_ui/styling/app_spacing.dart';
import 'package:common_ui/widgets/base_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:quickstart_flutter_bloc/features/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:quickstart_flutter_bloc/l10n/l10n.dart';

class ResetPasswordConfirmCodeForm extends StatelessWidget {
  const ResetPasswordConfirmCodeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.large),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.l10n.forgotPasswordPinDescription,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: AppSpacing.xlarge),
            const _PinCodeInput(),
            const SizedBox(height: AppSpacing.large),
            const _ResendCodeButton(),
          ],
        ),
      ),
    );
  }
}

class _PinCodeInput extends StatelessWidget {
  const _PinCodeInput();

  @override
  Widget build(BuildContext context) {
    return Pinput(
      onChanged: (value) => context
          .read<ForgotPasswordBloc>()
          .add(ForgotPasswordCodeChanged(value)),
      onSubmitted: (value) => context
          .read<ForgotPasswordBloc>()
          .add(ForgotPasswordConfirmCodeSubmitted()),
    );
  }
}

class _ResendCodeButton extends StatelessWidget {
  const _ResendCodeButton();

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      text: context.l10n.resendCode,
      onPressed: () => context
          .read<ForgotPasswordBloc>()
          .add(ForgotPasswordResendCodePressed()),
    );
  }
}
