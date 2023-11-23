import 'package:common_ui/widgets/base_button.dart';
import 'package:common_ui/widgets/base_snack_bar.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode baseSnackBarExample = WidgetbookUseCase(
  name: 'BaseSnackBar',
  builder: (context) => BaseButton(
    text: 'Show SnackBar',
    onPressed: () => context.showSnackBar(
      message: context.knobs.string(
        label: 'Message',
        initialValue: 'Example',
      ),
      type: context.knobs.list(
        label: 'Type',
        options: SnackBarType.values,
      ),
    ),
  ),
);
