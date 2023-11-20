import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:common_ui/styling/app_spacing.dart';
import 'package:common_ui/widgets/base_button.dart';
import 'package:common_ui/widgets/base_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:quickstart_flutter_bloc/features/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';

@RoutePage()
class EditProfileView extends StatelessWidget implements AutoRouteWrapper {
  const EditProfileView({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: AppInjector.instance.get<EditProfileBloc>(),
      child: const EditProfileView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.editProfile.title),
      ),
      body: BlocListener<EditProfileBloc, EditProfileState>(
        listener: (context, state) {
          if (state.status.isSuccess) {
            context.popRoute();
          }
        },
        child: const Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(AppSpacing.large),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _FirstNameTextField(),
                SizedBox(height: AppSpacing.medium),
                _LastNameTextField(),
                SizedBox(height: AppSpacing.medium),
                _EmailTextField(),
                SizedBox(height: AppSpacing.large),
                _SubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FirstNameTextField extends StatelessWidget {
  const _FirstNameTextField();

  @override
  Widget build(BuildContext context) {
    return BaseTextField(
      label: context.l10n.common.firstName,
      textInputAction: TextInputAction.next,
    );
  }
}

class _LastNameTextField extends StatelessWidget {
  const _LastNameTextField();

  @override
  Widget build(BuildContext context) {
    return BaseTextField(
      label: context.l10n.common.lastName,
      textInputAction: TextInputAction.next,
    );
  }
}

class _EmailTextField extends StatelessWidget {
  const _EmailTextField();

  @override
  Widget build(BuildContext context) {
    return BaseTextField(
      label: context.l10n.common.email,
      textInputAction: TextInputAction.done,
      onSubmitted: (_) =>
          context.read<EditProfileBloc>().add(EditProfileSubmitted()),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileBloc, EditProfileState>(
      builder: (context, state) {
        return BaseButton(
          text: context.l10n.common.save,
          isLoading: state.status.isInProgress,
          isEnabled: state.isValid,
          onPressed: () =>
              context.read<EditProfileBloc>().add(EditProfileSubmitted()),
        );
      },
    );
  }
}
