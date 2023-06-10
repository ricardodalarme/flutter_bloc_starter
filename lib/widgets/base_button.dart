import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    super.key,
  });

  final String text;
  final bool isLoading;
  final bool isEnabled;
  final VoidCallback onPressed;

  VoidCallback? get callback {
    if (!isEnabled) return null;
    if (isLoading) return () {};
    return onPressed;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: callback,
        child: isLoading ? const CircularProgressIndicator() : Text(text),
      ),
    );
  }
}
