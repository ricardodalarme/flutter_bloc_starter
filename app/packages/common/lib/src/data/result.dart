import 'package:meta/meta.dart';

/// Base Result class
/// [S] represents the type of the success value
/// [E] should be [Exception] or a subclass of it
sealed class Result<S, E extends Exception> {
  const Result();
}

@immutable
final class Success<S, E extends Exception> extends Result<S, E> {
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
final class Failure<E extends Exception> extends Result<Never, E> {
  const Failure(this.exception);

  final E exception;

  @override
  bool operator ==(Object other) =>
      other is Failure &&
      other.runtimeType == runtimeType &&
      other.exception == exception;

  @override
  int get hashCode => exception.hashCode;
}
