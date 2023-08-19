import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/app/bloc/app_bloc.dart';
import 'package:flutter_bloc_starter/l10n/l10n.dart';
import 'package:flutter_bloc_starter/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.profile),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () => context.push(AppPaths.changePassword),
              child: Text(context.l10n.changePassword),
            ),
            FilledButton(
              onPressed: () =>
                  context.read<AppBloc>().add(const AppLogoutRequested()),
              child: Text(context.l10n.logout),
            ),
          ],
        ),
      ),
    );
  }
}
