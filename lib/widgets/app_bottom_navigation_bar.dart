import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fp_util/fp_util.dart';
import 'package:hugeicons/hugeicons.dart';

import '../providers/bottom_nav_bar_provider.dart';

class AppBottomNavigationBar extends ConsumerWidget {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.theme;
    final currentIndex = ref.watch(bottomNavBarNotifierProvider);
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          label: 'Analytics',
          icon: Icon(HugeIcons.strokeRoundedAnalyticsUp),
        ),
        BottomNavigationBarItem(
          label: 'Inventory',
          icon: Icon(HugeIcons.strokeRoundedVegetarianFood),
        ),
        BottomNavigationBarItem(
          label: 'Sales',
          icon: Icon(HugeIcons.strokeRoundedMoneyBag02),
        ),
        BottomNavigationBarItem(
          label: 'Customers',
          icon: Icon(HugeIcons.strokeRoundedUserGroup),
        ),
        BottomNavigationBarItem(
          label: 'Account',
          icon: Icon(HugeIcons.strokeRoundedAccountSetting02),
        ),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      selectedLabelStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
      ),
      onTap: ref.read(bottomNavBarNotifierProvider.notifier).onTab,
    );
  }
}
