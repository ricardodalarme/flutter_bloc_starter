import 'package:auto_route/auto_route.dart';
import 'package:common/di/app_injector.dart';
import 'package:common_ui/styling/app_spacing.dart';
import 'package:common_ui/widgets/base_button.dart';
import 'package:common_ui/widgets/base_text_field.dart';
import 'package:common_ui/widgets/password_text_field.dart';
import 'package:common_ui/widgets/sign_in_button.dart';
import 'package:common_ui/widgets/text_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';
import 'package:quickstart_flutter_bloc/features/login/presentation/bloc/login_bloc.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';
import 'package:quickstart_flutter_bloc/routes/app_router.dart';

@RoutePage()
class LoginView extends StatelessWidget implements AutoRouteWrapper {
  const LoginView({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: AppInjector.instance.get<LoginBloc>(),
      child: const LoginView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.login.title),
      ),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status.isSuccess) {
            context.router.replaceAll([const HomeRoute()]);
          }
        },
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.large),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const _UsernameTextField(),
                const Gap(AppSpacing.medium),
                const _PasswordTextField(),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      context.pushRoute(const ForgotPasswordRoute());
                    },
                    child: Text(
                      context.l10n.login.buttonForgotPassword,
                    ),
                  ),
                ),
                const Gap(AppSpacing.small),
                const _LoginButton(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: AppSpacing.large),
                  child: TextDivider(context.l10n.login.dividerOr),
                ),
                const _SignInWithThirdPartyButtons(),
                const _SignupButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _UsernameTextField extends StatelessWidget {
  const _UsernameTextField();

  @override
  Widget build(BuildContext context) {
    return BaseTextField(
      label: context.l10n.common.username,
      onChanged: (username) =>
          context.read<LoginBloc>().add(LoginUsernameChanged(username)),
      keyboardType: TextInputType.text,
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
      label: context.l10n.common.password,
      textInputAction: TextInputAction.done,
      onSubmitted: (_) => context.read<LoginBloc>().add(const LoginSubmitted()),
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
          text: context.l10n.login.buttonLogin,
          isLoading: state.status.isInProgress,
          isEnabled: state.isValid,
          onPressed: () =>
              context.read<LoginBloc>().add(const LoginSubmitted()),
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
          text: (provider) =>
              context.l10n.login.buttonSignInWith(provider: provider.text),
          onPressed: () =>
              context.read<LoginBloc>().add(const LoginWithGoogleSubmitted()),
        ),
        SignInButton(
          ButtonProvider.facebook,
          text: (provider) =>
              context.l10n.login.buttonSignInWith(provider: provider.text),
          onPressed: () =>
              context.read<LoginBloc>().add(const LoginWithFacebookSubmitted()),
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
        await context.pushRoute(const SignUpRoute());
      },
      child: Text.rich(
        context.l10n.login.buttonNewAccount(
          signUp: (text) => TextSpan(
            text: text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
