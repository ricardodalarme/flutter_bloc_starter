import 'package:meta/meta.dart';

/// Base Result class
/// [S] represents the type of the success value
sealed class Result<S> {
  const Result();
}

@immutable
final class Success<S> extends Result<S> {
  const Success(this.value);

  final S value;

  @override
  bool operator ==(Object other) =>
      other is Success &&
      other.runtimeType == runtimeType &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;
}

@immutable
final class Failure extends Result<Never> {
  const Failure(this.exception);

  final Exception exception;

  @override
  bool operator ==(Object other) =>
      other is Failure &&
      other.runtimeType == runtimeType &&
      other.exception == exception;

  @override
  int get hashCode => exception.hashCode;
}
