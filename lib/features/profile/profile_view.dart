import 'package:common_ui/styling/app_spacing.dart';
import 'package:common_ui/widgets/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quickstart_flutter_bloc/features/app/bloc/app_bloc.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';
import 'package:quickstart_flutter_bloc/routes/app_routes.dart';

const _profilePictureSize = 175.0;

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.profile),
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
              const SizedBox(height: AppSpacing.xxlarge),
              ListTile(
                title: Text(context.l10n.editProfile),
                leading: const Icon(Icons.person),
                onTap: () => context.push(AppPaths.editProfile),
              ),
              ListTile(
                title: Text(context.l10n.changePassword),
                leading: const Icon(Icons.lock),
                onTap: () => context.push(AppPaths.changePassword),
              ),
              ListTile(
                title: Text(context.l10n.settings),
                leading: const Icon(Icons.settings),
                onTap: () => context.push(AppPaths.settings),
              ),
              ListTile(
                title: Text(context.l10n.privacyPolicy),
                leading: const Icon(Icons.privacy_tip),
                onTap: () => context.push(AppPaths.privacyPolicy),
              ),
              ListTile(
                title: Text(context.l10n.termsOfUse),
                leading: const Icon(Icons.description),
                onTap: () => context.push(AppPaths.termsOfUse),
              ),
              ListTile(
                title: Text(context.l10n.logout),
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
