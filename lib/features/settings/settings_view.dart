import 'package:flutter/material.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.settings),
      ),
      body: const Center(
        child: Text('SettingsView'),
      ),
    );
  }
}
