import 'package:common_ui/styling/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:quickstart_flutter_bloc/features/search/widgets/search_text_field.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.search.title),
      ),
      body: const Padding(
        padding: EdgeInsets.all(AppSpacing.medium),
        child: SearchTextField(),
      ),
    );
  }
}
