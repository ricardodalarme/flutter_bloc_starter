import 'package:common/common.dart';

final class NoDataException extends L10nPlaceholderException {
  const NoDataException() : super(l10nPlaceholder: 'noData');
}
