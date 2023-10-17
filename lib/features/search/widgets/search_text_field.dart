import 'package:flutter/material.dart';
import 'package:quickstart_flutter_bloc/styling/app_spacing.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    super.key,
    this.onChanged,
    this.onSubmitted,
  });

  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: _controller,
      onSubmitted: widget.onSubmitted,
      shadowColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
      leading: const Padding(
        padding: EdgeInsets.all(AppSpacing.small),
        child: Icon(Icons.search),
      ),
      trailing: [
        IconButton(
          onPressed: _controller.clear,
          icon: const Icon(Icons.clear),
        ),
      ],
    );
  }
}
