import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  TextTheme get typography => Theme.of(this).textTheme;
  ColorScheme get colors => Theme.of(this).colorScheme;
}
