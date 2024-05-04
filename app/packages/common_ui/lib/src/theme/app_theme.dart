import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show ThemeData;

abstract final class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
  );
  static final dark = ThemeData(
    brightness: Brightness.dark,
  );
}
