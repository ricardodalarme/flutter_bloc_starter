import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickstart_flutter_bloc/features/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:quickstart_flutter_bloc/features/forgot_password/pages/forgot_password_confirm_code_form.dart';
import 'package:quickstart_flutter_bloc/features/forgot_password/pages/forgot_password_email_form.dart';
import 'package:quickstart_flutter_bloc/features/forgot_password/pages/forgot_password_reset_password.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.forgotPassword.title),
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
