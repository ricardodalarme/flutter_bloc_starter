/// Default Spacing in App UI.
abstract class AppSpacing {
  /// The default unit of spacing
  static const double spaceUnit = 16;

  /// none spacing value (0pt)
  static const double none = 0.0;

  /// xxxs spacing value (1pt)
  static const double xxxsmall = 0.0625 * spaceUnit;

  /// xxs spacing value (2pt)
  static const double xxsmall = 0.125 * spaceUnit;

  /// xs spacing value (4pt)
  static const double xsmall = 0.25 * spaceUnit;

  /// sm spacing value (8pt)
  static const double small = 0.5 * spaceUnit;

  /// md spacing value (12pt)
  static const double medium = 0.75 * spaceUnit;

  /// lg spacing value (16pt)
  static const double large = spaceUnit;

  /// xlg spacing value (24pt)
  static const double xlarge = 1.5 * spaceUnit;

  /// xxlg spacing value (40pt)
  static const double xxlarge = 2.5 * spaceUnit;

  /// xxxlg pacing value (64pt)
  static const double xxxlarge = 4 * spaceUnit;
}
