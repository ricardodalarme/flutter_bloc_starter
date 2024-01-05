import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:flutter/material.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';

@RoutePage()
class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: context.l10n.settings.title,
      body: const Center(
        child: Text('SettingsView'),
      ),
    );
  }
}
