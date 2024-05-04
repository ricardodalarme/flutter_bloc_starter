import 'package:flutter/material.dart' show Colors, ScaffoldMessenger, SnackBar;
import 'package:flutter/widgets.dart';

enum SnackBarType { success, error }

extension ContextSnackBarExtension on BuildContext {
  void showSnackBar({
    required String message,
    required SnackBarType type,
  }) {
    final baseSnackBar = SnackBar(
      content: Text(message),
      backgroundColor: type == SnackBarType.success ? Colors.green : Colors.red,
    );
    ScaffoldMessenger.of(this).showSnackBar(baseSnackBar);
  }
}
