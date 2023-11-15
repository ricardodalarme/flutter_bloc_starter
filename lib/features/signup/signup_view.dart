import 'package:authentication_repository/authentication_repository.dart';
import 'package:common_ui/styling/app_spacing.dart';
import 'package:common_ui/widgets/base_button.dart';
import 'package:common_ui/widgets/base_text_field.dart';
import 'package:common_ui/widgets/password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:quickstart_flutter_bloc/features/signup/bloc/signup_bloc.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';
import 'package:quickstart_flutter_bloc/routes/app_routes.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.signUp),
      ),
      body: BlocProvider(
        create: (context) => SignupBloc(
          authenticationRepository: context.read<AuthenticationRepository>(),
        ),
        child: BlocListener<SignupBloc, SignupState>(
          listener: (context, state) {
            if (state.status.isSuccess) {
              context.go(AppPaths.home);
            }
          },
          child: const Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(AppSpacing.large),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _EmailTextField(),
                  SizedBox(height: AppSpacing.medium),
                  _PasswordTextField(),
                  SizedBox(height: AppSpacing.medium),
                  _ConfirmPasswordTextField(),
                  SizedBox(height: AppSpacing.large),
                  _SubmitButton(),
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
      label: context.l10n.email,
      onChanged: (email) =>
          context.read<SignupBloc>().add(SignupEmailChanged(email)),
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
          context.read<SignupBloc>().add(SignupPasswordChanged(password)),
      label: context.l10n.password,
      textInputAction: TextInputAction.next,
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
      label: context.l10n.confirmPassword,
      textInputAction: TextInputAction.done,
      onSubmitted: (_) => context.read<SignupBloc>().add(SignupSubmitted()),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return BaseButton(
          text: context.l10n.signUp,
          isLoading: state.status.isInProgress,
          isEnabled: state.isValid,
          onPressed: () => context.read<SignupBloc>().add(SignupSubmitted()),
        );
      },
    );
  }
}
