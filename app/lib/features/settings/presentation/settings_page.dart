import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: context.l10n.settings.title,
      body: const Center(
        child: Text('SettingsPage'),
      ),
    );
  }
}
