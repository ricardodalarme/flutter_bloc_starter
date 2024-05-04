import 'package:flutter/material.dart' show ColorScheme, TextTheme, Theme;
import 'package:flutter/widgets.dart';

extension ThemeExtension on BuildContext {
  TextTheme get typography => Theme.of(this).textTheme;
  ColorScheme get colors => Theme.of(this).colorScheme;
}
