class AnalyticsException implements Exception {
  final String message;

  AnalyticsException(this.message);

  @override
  String toString() => message;
}

class LogEventException implements Exception {
  final String message;

  LogEventException(this.message);

  @override
  String toString() => message;
}

class SetUserIdException implements Exception {
  final String message;

  SetUserIdException(this.message);

  @override
  String toString() => message;
}
