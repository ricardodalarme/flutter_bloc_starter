import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/blocs/forgot_password/forgot_password_bloc.dart';
import 'package:flutter_bloc_starter/l10n/l10n.dart';
import 'package:flutter_bloc_starter/styling/app_spacing.dart';
import 'package:pinput/pinput.dart';

class ResetPasswordConfirmCodeForm extends StatelessWidget {
  const ResetPasswordConfirmCodeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        FilledButton(
          onPressed: null,
          child: Text(context.l10n.resendCode),
        ),
      ],
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
    );
  }
}
