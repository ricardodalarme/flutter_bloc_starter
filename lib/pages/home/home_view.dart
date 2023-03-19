import 'package:flutter/material.dart';
import 'package:flutter_bloc_starter/routes/app_routes.dart';
import 'package:flutter_bloc_starter/styling/app_spacing.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.medium),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Home View'),
              const SizedBox(height: Spacing.medium),
              FilledButton(
                onPressed: () {
                  context.go(AppPaths.login);
                },
                child: const Text('Logout'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
