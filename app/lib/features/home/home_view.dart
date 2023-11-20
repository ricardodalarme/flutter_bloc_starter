import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickstart_flutter_bloc/features/home/cubit/home_cubit.dart';
import 'package:quickstart_flutter_bloc/features/home/widgets/navigation_bar.dart';
import 'package:quickstart_flutter_bloc/features/post/presentation/post_view.dart';
import 'package:quickstart_flutter_bloc/features/profile/profile_view.dart';
import 'package:quickstart_flutter_bloc/features/search/search_view.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';

@RoutePage()
class HomeView extends StatelessWidget implements AutoRouteWrapper {
  const HomeView({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: const HomeView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.watch<HomeCubit>().state;

    return Scaffold(
      bottomNavigationBar: NavBar(
        currentIndex: selectedTab,
        onTap: (index) => context.read<HomeCubit>().setTab(index),
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
      body: IndexedStack(
        index: selectedTab,
        children: const [
          PostView(),
          SearchView(),
          ProfileView(),
        ],
      ),
    );
  }
}
