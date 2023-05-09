import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/blocs/change_password/change_password_bloc.dart';
import 'package:flutter_bloc_starter/l10n/l10n.dart';
import 'package:flutter_bloc_starter/routes/app_routes.dart';
import 'package:flutter_bloc_starter/styling/app_spacing.dart';
import 'package:flutter_bloc_starter/widgets/password_text_field.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.changePassword),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.large),
        child: BlocProvider(
          create: (context) => ChangePasswordBloc(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const _CurrentPasswordTextField(),
              const SizedBox(height: AppSpacing.medium),
              const _NewPasswordTextField(),
              const SizedBox(height: AppSpacing.medium),
              const _ConfirmPasswordTextField(),
              const SizedBox(height: AppSpacing.large),
              FilledButton(
                onPressed: () {
                  context.go(AppPaths.home);
                },
                child: Text(context.l10n.save),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CurrentPasswordTextField extends StatelessWidget {
  const _CurrentPasswordTextField();

  @override
  Widget build(BuildContext context) {
    return PasswordTextField(
      onChanged: (password) => context
          .read<ChangePasswordBloc>()
          .add(ChangePasswordCurrentPasswordChanged(password)),
      labelText: context.l10n.currentPassword,
    );
  }
}

class _NewPasswordTextField extends StatelessWidget {
  const _NewPasswordTextField();

  @override
  Widget build(BuildContext context) {
    return PasswordTextField(
      onChanged: (password) => context
          .read<ChangePasswordBloc>()
          .add(ChangePasswordNewPasswordChanged(password)),
      labelText: context.l10n.newPassword,
    );
  }
}

class _ConfirmPasswordTextField extends StatelessWidget {
  const _ConfirmPasswordTextField();

  @override
  Widget build(BuildContext context) {
    return PasswordTextField(
      onChanged: (password) => context
          .read<ChangePasswordBloc>()
          .add(ChangePasswordConfirmPasswordChanged(password)),
      labelText: context.l10n.confirmPassword,
    );
  }
}
