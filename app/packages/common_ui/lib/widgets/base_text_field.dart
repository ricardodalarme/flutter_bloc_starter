import 'package:flutter/material.dart';

class BaseTextField extends StatelessWidget {
  const BaseTextField({
    super.key,
    this.label,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.obscureText = false,
    this.onChanged,
    this.textInputAction,
    this.onSubmitted,
    this.keyboardType,
    this.suffixIcon,
  });

  final String? label;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final bool autocorrect;
  final bool enableSuggestions;
  final bool obscureText;
  final Widget? suffixIcon;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: autocorrect,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: suffixIcon,
      ),
      enableSuggestions: enableSuggestions,
      obscureText: obscureText,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
    );
  }
}
