import 'package:equatable/equatable.dart';

final class SettingsModel with EquatableMixin {
  const SettingsModel({
    required this.hasOnboarded,
  });

  const SettingsModel.empty() : hasOnboarded = false;

  final bool hasOnboarded;

  SettingsModel copyWith({
    bool? hasOnboarded,
  }) {
    return SettingsModel(
      hasOnboarded: hasOnboarded ?? this.hasOnboarded,
    );
  }

  @override
  List<Object?> get props => [
        hasOnboarded,
      ];
}
