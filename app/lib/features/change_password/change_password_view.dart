import 'package:common/common.dart';
import 'package:common_ui/styling/app_spacing.dart';
import 'package:common_ui/widgets/base_button.dart';
import 'package:common_ui/widgets/password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:quickstart_flutter_bloc/features/change_password/bloc/change_password_bloc.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';
import 'package:quickstart_flutter_bloc/routes/app_routes.dart';
import 'package:user_repository/user_repository.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.changePassword.title),
      ),
      body: BlocProvider(
        create: (context) => ChangePasswordBloc(
          userRepository: AppInjector.instance.get<UserRepository>(),
        ),
        child: BlocListener<ChangePasswordBloc, ChangePasswordState>(
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
                  _CurrentPasswordTextField(),
                  SizedBox(height: AppSpacing.medium),
                  _NewPasswordTextField(),
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

class _CurrentPasswordTextField extends StatelessWidget {
  const _CurrentPasswordTextField();

  @override
  Widget build(BuildContext context) {
    return PasswordTextField(
      onChanged: (password) => context
          .read<ChangePasswordBloc>()
          .add(ChangePasswordCurrentPasswordChanged(password)),
      label: context.l10n.changePassword.labelCurrentPassword,
      textInputAction: TextInputAction.next,
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
      label: context.l10n.changePassword.labelNewPassword,
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
          .read<ChangePasswordBloc>()
          .add(ChangePasswordConfirmPasswordChanged(password)),
      label: context.l10n.changePassword.labelConfirmPassword,
      textInputAction: TextInputAction.done,
      onSubmitted: (_) =>
          context.read<ChangePasswordBloc>().add(ChangePasswordSubmitted()),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
      builder: (context, state) {
        return BaseButton(
          text: context.l10n.common.save,
          isLoading: state.status.isInProgress,
          isEnabled: state.isValid,
          onPressed: () =>
              context.read<ChangePasswordBloc>().add(ChangePasswordSubmitted()),
        );
      },
    );
  }
}
