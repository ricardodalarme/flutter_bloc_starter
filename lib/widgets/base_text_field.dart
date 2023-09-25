import 'package:flutter/material.dart';

class BaseTextField extends StatelessWidget {
  const BaseTextField({
    super.key,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.obscureText = false,
    this.onChanged,
    this.textInputAction,
    this.onSubmitted,
    this.decoration,
    this.keyboardType,
  });

  final InputDecoration? decoration;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final bool autocorrect;
  final bool enableSuggestions;
  final bool obscureText;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: autocorrect,
      decoration: decoration,
      enableSuggestions: enableSuggestions,
      obscureText: obscureText,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
    );
  }
}
