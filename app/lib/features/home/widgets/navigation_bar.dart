import 'package:flutter/material.dart';

class NavBarItem {
  const NavBarItem({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;
}

class NavBar extends StatelessWidget {
  const NavBar({
    required this.currentIndex,
    required this.onTap,
    required this.items,
    super.key,
  });

  final int currentIndex;
  final void Function(int) onTap;
  final List<NavBarItem> items;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: items
          .map(
            (item) => BottomNavigationBarItem(
              icon: Icon(item.icon),
              label: item.label,
            ),
          )
          .toList(),
    );
  }
}
