import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/blocs/signup/signup_bloc.dart';
import 'package:flutter_bloc_starter/l10n/l10n.dart';
import 'package:flutter_bloc_starter/routes/app_routes.dart';
import 'package:flutter_bloc_starter/styling/app_spacing.dart';
import 'package:flutter_bloc_starter/widgets/password_text_field.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.signUp),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.large),
          child: BlocProvider(
            create: (context) => SignupBloc(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const _EmailTextField(),
                const SizedBox(height: AppSpacing.medium),
                const _PasswordTextField(),
                const SizedBox(height: AppSpacing.medium),
                const _ConfirmPasswordTextField(),
                const SizedBox(height: AppSpacing.large),
                FilledButton(
                  onPressed: () {
                    context.go(AppPaths.home);
                  },
                  child: Text(context.l10n.signUp),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EmailTextField extends StatelessWidget {
  const _EmailTextField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (email) =>
          context.read<SignupBloc>().add(SignupEmailChanged(email)),
      decoration: InputDecoration(
        labelText: context.l10n.email,
      ),
    );
  }
}

class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField();

  @override
  Widget build(BuildContext context) {
    return PasswordTextField(
      onChanged: (password) =>
          context.read<SignupBloc>().add(SignupPasswordChanged(password)),
      labelText: context.l10n.password,
    );
  }
}

class _ConfirmPasswordTextField extends StatelessWidget {
  const _ConfirmPasswordTextField();

  @override
  Widget build(BuildContext context) {
    return PasswordTextField(
      onChanged: (password) => context
          .read<SignupBloc>()
          .add(SignupConfirmPasswordChanged(password)),
      labelText: context.l10n.confirmPassword,
    );
  }
}
