import 'package:flutter/material.dart';
import 'package:quickstart_flutter_bloc/l10n/l10n.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.privacyPolicy),
      ),
      body: Center(
        child: Text(context.l10n.privacyPolicy),
      ),
    );
  }
}
