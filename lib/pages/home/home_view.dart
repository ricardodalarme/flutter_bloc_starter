import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/blocs/app/app_bloc.dart';
import 'package:flutter_bloc_starter/l10n/l10n.dart';
import 'package:flutter_bloc_starter/routes/app_routes.dart';
import 'package:flutter_bloc_starter/styling/app_spacing.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.home)),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.medium),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton(
                onPressed: () {
                  context.push(AppPaths.changePassword);
                },
                child: Text(context.l10n.changePassword),
              ),
              FilledButton(
                onPressed: () =>
                    context.read<AppBloc>().add(const AppLogoutRequested()),
                child: Text(context.l10n.logout),
              )
            ],
          ),
        ),
      ),
    );
  }
}
