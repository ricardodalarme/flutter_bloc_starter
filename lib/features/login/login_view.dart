import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/login/bloc/login_bloc.dart';
import 'package:flutter_bloc_starter/l10n/l10n.dart';
import 'package:flutter_bloc_starter/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/routes/app_routes.dart';
import 'package:flutter_bloc_starter/styling/app_spacing.dart';
import 'package:flutter_bloc_starter/widgets/base_button.dart';
import 'package:flutter_bloc_starter/widgets/password_text_field.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.login),
      ),
      body: BlocProvider(
        create: (context) => LoginBloc(
          authenticationRepository: context.read<AuthenticationRepository>(),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.large),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const _EmailTextField(),
                const SizedBox(height: AppSpacing.medium),
                const _PasswordTextField(),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      context.push(AppPaths.forgotPassword);
                    },
                    child: Text(
                      context.l10n.forgotPassword,
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.large),
                const _LoginButton(),
                const _SignupButton(),
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
          context.read<LoginBloc>().add(LoginEmailChanged(email)),
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
          context.read<LoginBloc>().add(LoginPasswordChanged(password)),
      labelText: context.l10n.password,
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return BaseButton(
          text: context.l10n.login,
          isLoading: state.status.isInProgress,
          isEnabled: state.isValid,
          onPressed: () {
            context.read<LoginBloc>().add(LoginSubmitted());
            context.go(AppPaths.home);
          },
        );
      },
    );
  }
}

class _SignupButton extends StatelessWidget {
  const _SignupButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        await context.push(AppPaths.signup);
      },
      child: Text.rich(
        TextSpan(
          text: context.l10n.dontHaveAnAccount,
          children: [
            TextSpan(
              text: context.l10n.signUp,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
