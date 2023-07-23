import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:flutter_bloc_starter/features/forgot_password/pages/forgot_password_confirm_code_form.dart';
import 'package:flutter_bloc_starter/features/forgot_password/pages/forgot_password_email_form.dart';
import 'package:flutter_bloc_starter/features/forgot_password/pages/forgot_password_reset_password.dart';
import 'package:flutter_bloc_starter/l10n/l10n.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.recoverPassword),
      ),
      body: BlocProvider(
        create: (context) => ForgotPasswordBloc(),
        child: PageView(
          children: const [
            ForgotPasswordEmailForm(),
            ResetPasswordConfirmCodeForm(),
            ForgotPasswordResetPasswordForm(),
          ],
        ),
      ),
    );
  }
}
