import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: context.l10n.terms.title,
      body: Center(
        child: Text(context.l10n.terms.title),
      ),
    );
  }
}
