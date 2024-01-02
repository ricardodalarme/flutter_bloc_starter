import 'package:common_ui/widgets/base_text_field.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    required this.text,
    this.label,
    this.onChanged,
    this.textInputAction,
    this.onSubmitted,
    super.key,
  });

  final String text;
  final String? label;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final void Function(String)? onSubmitted;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BaseTextField(
      text: widget.text,
      obscureText: _obscureText,
      onChanged: widget.onChanged,
      autocorrect: false,
      enableSuggestions: false,
      textInputAction: widget.textInputAction,
      onSubmitted: widget.onSubmitted,
      label: widget.label,
      suffixIcon: ExcludeFocus(
        child: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () => setState(() => _obscureText = !_obscureText),
        ),
      ),
    );
  }
}
