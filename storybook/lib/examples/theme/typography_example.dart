import 'package:common_ui/common_ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode typographyExample = WidgetbookUseCase(
  name: 'Typography',
  builder: (context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('displayLarge', style: context.typography.displayLarge),
      Text('displayMedium', style: context.typography.displayMedium),
      Text('displaySmall', style: context.typography.displaySmall),
      Text('headlineMedium', style: context.typography.headlineMedium),
      Text('headlineSmall', style: context.typography.headlineSmall),
      Text('titleLarge', style: context.typography.titleLarge),
      Text('titleMedium', style: context.typography.titleMedium),
      Text('titleSmall', style: context.typography.titleSmall),
      Text('bodyLarge', style: context.typography.bodyLarge),
      Text('bodyMedium', style: context.typography.bodyMedium),
      Text('bodySmall', style: context.typography.bodySmall),
      Text('labelLarge', style: context.typography.labelLarge),
      Text('labelSmall', style: context.typography.labelSmall),
    ],
  ),
);
