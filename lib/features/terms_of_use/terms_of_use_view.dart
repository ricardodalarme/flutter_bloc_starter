import 'package:flutter/material.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';

class TermsOfUseView extends StatelessWidget {
  const TermsOfUseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.termsOfUse),
      ),
      body: Center(
        child: Text(context.l10n.termsOfUse),
      ),
    );
  }
}
