import 'package:flutter/material.dart';
import 'package:flutter_bloc_starter/l10n/l10n.dart';

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
