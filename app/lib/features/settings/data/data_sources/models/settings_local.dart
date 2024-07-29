import 'package:equatable/equatable.dart';

final class SettingsLocal with EquatableMixin {
  const SettingsLocal({
    required this.hasOnboarded,
  });

  SettingsLocal.fromMap(Map<String, dynamic> map)
      : hasOnboarded = map['hasOnboarded'] as bool;

  final bool hasOnboarded;

  Map<String, dynamic> toMap() => {
        'hasOnboarded': hasOnboarded,
      };

  @override
  List<Object?> get props => [
        hasOnboarded,
      ];
}
