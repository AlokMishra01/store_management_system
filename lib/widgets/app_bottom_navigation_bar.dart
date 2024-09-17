import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/bottom_nav_bar_provider.dart';

class AppBottomNavigationBar extends ConsumerWidget {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavBarNotifierProvider);
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          label: 'Dashboard',
          icon: Icon(CupertinoIcons.graph_circle),
          activeIcon: Icon(CupertinoIcons.graph_circle_fill),
        ),
        BottomNavigationBarItem(
          label: 'Inventory',
          icon: Icon(CupertinoIcons.tag_circle),
          activeIcon: Icon(CupertinoIcons.tag_circle_fill),
        ),
        BottomNavigationBarItem(
          label: 'Sales',
          icon: Icon(CupertinoIcons.money_dollar_circle),
          activeIcon: Icon(CupertinoIcons.money_dollar_circle_fill),
        ),
        BottomNavigationBarItem(
          label: 'Customers',
          icon: Icon(CupertinoIcons.person_circle),
          activeIcon: Icon(CupertinoIcons.person_circle_fill),
        ),
        BottomNavigationBarItem(
          label: 'Settings',
          icon: Icon(CupertinoIcons.ellipsis_vertical_circle),
          activeIcon: Icon(CupertinoIcons.ellipsis_vertical_circle_fill),
        ),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: ref.read(bottomNavBarNotifierProvider.notifier).onTab,
    );
  }
}
