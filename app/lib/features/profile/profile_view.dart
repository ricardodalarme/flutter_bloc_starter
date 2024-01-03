import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:quickstart_flutter_bloc/features/app/bloc/app_bloc.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';
import 'package:quickstart_flutter_bloc/routes/app_router.dart';

const _profilePictureSize = 175.0;

@RoutePage()
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.profile.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ProfilePicture(
                photoUrl: null,
                size: _profilePictureSize,
              ),
              const Gap(AppSpacing.xxlarge),
              ListTile(
                title: Text(context.l10n.profile.buttonEditProfile),
                leading: const Icon(Icons.person),
                onTap: () => context.pushRoute(const EditProfileRoute()),
              ),
              ListTile(
                title: Text(context.l10n.profile.buttonChangePassword),
                leading: const Icon(Icons.lock),
                onTap: () => context.pushRoute(const ChangePasswordRoute()),
              ),
              ListTile(
                title: Text(context.l10n.profile.buttonSettings),
                leading: const Icon(Icons.settings),
                onTap: () => context.pushRoute(const SettingsRoute()),
              ),
              ListTile(
                title: Text(context.l10n.profile.buttonPrivacyPolicy),
                leading: const Icon(Icons.privacy_tip),
                onTap: () => context.pushRoute(const PrivacyPolicyRoute()),
              ),
              ListTile(
                title: Text(context.l10n.profile.buttonTerms),
                leading: const Icon(Icons.description),
                onTap: () => context.pushRoute(const TermsRoute()),
              ),
              ListTile(
                title: Text(context.l10n.profile.buttonLogout),
                leading: const Icon(Icons.logout),
                onTap: () =>
                    context.read<AppBloc>().add(const AppLogoutRequested()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
