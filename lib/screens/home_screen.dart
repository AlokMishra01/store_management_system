import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/bottom_nav_bar_provider.dart';
import '../widgets/app_app_bar.dart';
import '../widgets/app_bottom_navigation_bar.dart';
import 'customers_screen.dart';
import 'dashboard_screen.dart';
import 'inventory_screen.dart';
import 'sales_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavBarNotifierProvider);
    return Scaffold(
      appBar: const AppAppBar(title: 'Dashboard'),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1), // Slide from bottom to top
              end: const Offset(0, 0), // Final position is on screen
            ).animate(animation),
            child: child,
          );
        }, // The page content
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        child: [
          const DashboardScreen(),
          const InventoryScreen(),
          const SalesScreen(),
          const CustomersScreen(),
          const SettingsScreen()
        ][currentIndex],
      ),
      floatingActionButton: AnimatedOpacity(
        opacity: currentIndex > 0 && currentIndex < 4 ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
        curve: currentIndex > 0 && currentIndex < 4
            ? Curves.easeInOut
            : Curves.easeInOut,
        child: currentIndex > 0 && currentIndex < 4
            ? FloatingActionButton(
                onPressed: () {},
                child: const Icon(CupertinoIcons.add),
              )
            : null,
      ),
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }
}
