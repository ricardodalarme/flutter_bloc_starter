import 'package:equatable/equatable.dart';

final class SettingsModel with EquatableMixin {
  const SettingsModel();

  const SettingsModel.empty();

  SettingsModel copyWith() {
    return const SettingsModel();
  }

  @override
  List<Object?> get props => [];
}
