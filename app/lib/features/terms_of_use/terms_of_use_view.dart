import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';

@RoutePage()
class TermsOfUseView extends StatelessWidget {
  const TermsOfUseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.termsOfUse.title),
      ),
      body: Center(
        child: Text(context.l10n.termsOfUse.title),
      ),
    );
  }
}
