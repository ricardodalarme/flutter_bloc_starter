import 'package:common_ui/widgets/base_text_field.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    required this.labelText,
    this.onChanged,
    this.textInputAction,
    this.onSubmitted,
    super.key,
  });

  final String labelText;
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
      obscureText: _obscureText,
      onChanged: widget.onChanged,
      autocorrect: false,
      enableSuggestions: false,
      textInputAction: widget.textInputAction,
      onSubmitted: widget.onSubmitted,
      decoration: InputDecoration(
        labelText: widget.labelText,
        suffixIcon: ExcludeFocus(
          child: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () => setState(() => _obscureText = !_obscureText),
          ),
        ),
      ),
    );
  }
}
