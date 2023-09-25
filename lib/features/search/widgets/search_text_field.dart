import 'package:flutter/material.dart';
import 'package:flutter_bloc_starter/styling/app_spacing.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    this.onClear,
    this.onChanged,
  });

  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      onChanged: onChanged,
      shadowColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
      leading: const Padding(
        padding: EdgeInsets.all(AppSpacing.small),
        child: Icon(Icons.search),
      ),
      trailing: [
        IconButton(
          onPressed: onClear,
          icon: const Icon(Icons.clear),
        ),
      ],
    );
  }
}
