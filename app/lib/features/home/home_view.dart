import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quickstart_flutter_bloc/features/home/widgets/navigation_bar.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';
import 'package:quickstart_flutter_bloc/routes/app_router.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        PostRoute(),
        SearchRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) => NavBar(
        currentIndex: tabsRouter.activeIndex,
        onTap: tabsRouter.setActiveIndex,
        items: [
          NavBarItem(
            icon: Icons.home_rounded,
            label: context.l10n.post.title,
          ),
          NavBarItem(
            icon: Icons.search_rounded,
            label: context.l10n.search.title,
          ),
          NavBarItem(
            icon: Icons.person,
            label: context.l10n.profile.title,
          ),
        ],
      ),
    );
  }
}
