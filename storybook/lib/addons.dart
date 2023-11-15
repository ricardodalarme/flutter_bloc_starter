import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

final List<WidgetbookTheme<ThemeData>> themes = [
  WidgetbookTheme(
    name: 'Light',
    data: ThemeData.light(useMaterial3: true),
  ),
  WidgetbookTheme(
    name: 'Dark',
    data: ThemeData.dark(useMaterial3: true),
  ),
];

final List<double> textScales = [
  1.0,
  1.5,
  2.0,
];

final List<WidgetbookAddon<dynamic>> addons = [
  MaterialThemeAddon(themes: themes),
  TextScaleAddon(scales: textScales),
  AlignmentAddon(),
];
