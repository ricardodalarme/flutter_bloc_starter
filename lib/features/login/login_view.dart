import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:quickstart_flutter_bloc/features/login/bloc/login_bloc.dart';
import 'package:quickstart_flutter_bloc/l10n/l10n.dart';
import 'package:quickstart_flutter_bloc/routes/app_routes.dart';
import 'package:quickstart_flutter_bloc/styling/app_spacing.dart';
import 'package:quickstart_flutter_bloc/widgets/base_button.dart';
import 'package:quickstart_flutter_bloc/widgets/base_text_field.dart';
import 'package:quickstart_flutter_bloc/widgets/password_text_field.dart';
import 'package:quickstart_flutter_bloc/widgets/sign_in_button.dart';
import 'package:quickstart_flutter_bloc/widgets/text_divider.dart';

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
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.status.isSuccess) {
              context.go(AppPaths.home);
            }
          },
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
                  const SizedBox(height: AppSpacing.small),
                  const _LoginButton(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: AppSpacing.large),
                    child: TextDivider(context.l10n.or.toUpperCase()),
                  ),
                  const _SignInWithThirdPartyButtons(),
                  const _SignupButton(),
                ],
              ),
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
    return BaseTextField(
      onChanged: (email) =>
          context.read<LoginBloc>().add(LoginEmailChanged(email)),
      decoration: InputDecoration(
        labelText: context.l10n.email,
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
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
      textInputAction: TextInputAction.done,
      onSubmitted: (_) => context.read<LoginBloc>().add(LoginSubmitted()),
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
          onPressed: () => context.read<LoginBloc>().add(LoginSubmitted()),
        );
      },
    );
  }
}

class _SignInWithThirdPartyButtons extends StatelessWidget {
  const _SignInWithThirdPartyButtons();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SignInButton(
          ButtonProvider.google,
          onPressed: () =>
              context.read<LoginBloc>().add(LoginWithGoogleSubmitted()),
        ),
        SignInButton(
          ButtonProvider.facebook,
          onPressed: () =>
              context.read<LoginBloc>().add(LoginWithFacebookSubmitted()),
        ),
      ],
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
