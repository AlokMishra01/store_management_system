import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store_management_system/providers/bottom_nav_bar_provider.dart';
import 'package:store_management_system/themes/app_colors.dart';

class AppBottomNavigationBar extends ConsumerWidget {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavBarNotifierProvider);
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: CustomNavigationBar(
        items: [
          CustomNavigationBarItem(
            icon: const Icon(CupertinoIcons.graph_circle),
            selectedIcon: const Icon(CupertinoIcons.graph_circle_fill),
          ),
          CustomNavigationBarItem(
            icon: const Icon(CupertinoIcons.tag_circle),
            selectedIcon: const Icon(CupertinoIcons.tag_circle_fill),
          ),
          CustomNavigationBarItem(
            icon: const Icon(CupertinoIcons.money_dollar_circle),
            selectedIcon: const Icon(CupertinoIcons.money_dollar_circle_fill),
          ),
          CustomNavigationBarItem(
            icon: const Icon(CupertinoIcons.person_circle),
            selectedIcon: const Icon(CupertinoIcons.person_circle_fill),
          ),
          CustomNavigationBarItem(
            icon: const Icon(CupertinoIcons.ellipsis_vertical_circle),
            selectedIcon: const Icon(
              CupertinoIcons.ellipsis_vertical_circle_fill,
            ),
          ),
        ],
        backgroundColor: AppColorsLight().onSuccess,
        unSelectedColor: AppColorsLight().lightText,
        selectedColor: AppColorsLight().primary,
        strokeColor: AppColorsLight().secondary,
        elevation: 4.0,
        isFloating: true,
        borderRadius: const Radius.circular(16),
        bubbleCurve: Curves.linearToEaseOut,
        scaleCurve: Curves.linearToEaseOut,
        iconSize: 28.0,
        currentIndex: currentIndex,
        onTap: ref.read(bottomNavBarNotifierProvider.notifier).onTab,
      ),
    );
  }
}
