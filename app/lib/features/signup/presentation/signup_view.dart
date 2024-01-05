import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:common_ui/common_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';
import 'package:quickstart_flutter_bloc/features/signup/presentation/bloc/signup_bloc.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';
import 'package:quickstart_flutter_bloc/routes/app_router.dart';

@RoutePage()
class SignUpView extends StatelessWidget implements AutoRouteWrapper {
  const SignUpView({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: AppInjector.instance.get<SignupBloc>(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: context.l10n.signup.title,
      body: BlocListener<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state.status.isSuccess) {
            context.router.replaceAll([const HomeRoute()]);
          }
        },
        child: const Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(AppSpacing.large),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _UsernameTextField(),
                Gap(AppSpacing.medium),
                _EmailTextField(),
                Gap(AppSpacing.medium),
                _PasswordTextField(),
                Gap(AppSpacing.medium),
                _ConfirmPasswordTextField(),
                Gap(AppSpacing.large),
                _SubmitButton(),
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
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) => BaseTextField(
        text: state.username.value,
        label: context.l10n.common.username,
        onChanged: (username) =>
            context.read<SignupBloc>().add(SignupUsernameChanged(username)),
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}

class _EmailTextField extends StatelessWidget {
  const _EmailTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) => BaseTextField(
        text: state.email.value,
        label: context.l10n.common.email,
        onChanged: (email) =>
            context.read<SignupBloc>().add(SignupEmailChanged(email)),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}

class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) => PasswordTextField(
        text: state.password.value,
        onChanged: (password) =>
            context.read<SignupBloc>().add(SignupPasswordChanged(password)),
        label: context.l10n.common.password,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}

class _ConfirmPasswordTextField extends StatelessWidget {
  const _ConfirmPasswordTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) =>
          previous.confirmPassword != current.confirmPassword,
      builder: (context, state) => PasswordTextField(
        text: state.confirmPassword.value,
        onChanged: (password) => context
            .read<SignupBloc>()
            .add(SignupConfirmPasswordChanged(password)),
        label: context.l10n.signup.labelConfirmPassword,
        textInputAction: TextInputAction.done,
        onSubmitted: (_) =>
            context.read<SignupBloc>().add(const SignupSubmitted()),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) => BaseButton(
        text: context.l10n.signup.buttonSubmit,
        isLoading: state.status.isInProgress,
        isEnabled: state.isValid,
        onPressed: () =>
            context.read<SignupBloc>().add(const SignupSubmitted()),
      ),
    );
  }
}
