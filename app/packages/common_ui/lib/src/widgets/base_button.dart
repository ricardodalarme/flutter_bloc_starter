import 'package:flutter/material.dart';

const _loadingSize = 24.0;
const _loadingStrokeWidth = 2.0;

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
      child: FilledButton(
        onPressed: callback,
        child: isLoading ? const _LoadingIndicator() : Text(text),
      ),
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: _loadingSize,
        maxWidth: _loadingSize,
      ),
      child: const CircularProgressIndicator(
        strokeWidth: _loadingStrokeWidth,
        color: Colors.white,
      ),
    );
  }
}
