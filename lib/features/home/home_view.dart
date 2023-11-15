import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickstart_flutter_bloc/features/feed/feed_view.dart';
import 'package:quickstart_flutter_bloc/features/home/cubit/home_cubit.dart';
import 'package:quickstart_flutter_bloc/features/home/widgets/navigation_bar.dart';
import 'package:quickstart_flutter_bloc/features/profile/profile_view.dart';
import 'package:quickstart_flutter_bloc/features/search/search_view.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Builder(
        builder: (context) {
          final selectedTab = context.select((HomeCubit cubit) => cubit.state);

          return Scaffold(
            bottomNavigationBar: NavBar(
              currentIndex: selectedTab,
              onTap: (index) => context.read<HomeCubit>().setTab(index),
              items: [
                NavBarItem(icon: Icons.home_rounded, label: context.l10n.feed),
                NavBarItem(
                  icon: Icons.search_rounded,
                  label: context.l10n.search,
                ),
                NavBarItem(icon: Icons.person, label: context.l10n.profile),
              ],
            ),
            body: IndexedStack(
              index: selectedTab,
              children: const [
                FeedView(),
                SearchView(),
                ProfileView(),
              ],
            ),
          );
        },
      ),
    );
  }
}
