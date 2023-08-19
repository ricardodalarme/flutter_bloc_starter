import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/feed/feed_view.dart';
import 'package:flutter_bloc_starter/features/home/cubit/home_cubit.dart';
import 'package:flutter_bloc_starter/features/home/widgets/navigation_bar.dart';
import 'package:flutter_bloc_starter/features/profile/profile_view.dart';
import 'package:flutter_bloc_starter/l10n/l10n.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Builder(
        builder: (context) {
          final selectedTab =
              context.select((HomeCubit cubit) => cubit.state.index);

          return Scaffold(
            bottomNavigationBar: NavBar(
              currentIndex: selectedTab,
              onTap: (index) => context.read<HomeCubit>().setTab(index),
              items: [
                NavBarItem(icon: Icons.home_rounded, label: context.l10n.feed),
                NavBarItem(icon: Icons.person, label: context.l10n.profile),
              ],
            ),
            body: IndexedStack(
              index: selectedTab,
              children: const [
                FeedView(),
                ProfileView(),
              ],
            ),
          );
        },
      ),
    );
  }
}
