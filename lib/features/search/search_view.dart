import 'package:flutter/material.dart';
import 'package:flutter_bloc_starter/features/search/widgets/search_text_field.dart';
import 'package:flutter_bloc_starter/l10n/l10n.dart';
import 'package:flutter_bloc_starter/styling/app_spacing.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.search),
      ),
      body: const Padding(
        padding: EdgeInsets.all(AppSpacing.medium),
        child: SearchTextField(),
      ),
    );
  }
}
