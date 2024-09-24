import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fp_util/fp_util.dart';
import 'package:hugeicons/hugeicons.dart';

import '../providers/auth_provider.dart';
import '../providers/store_details_provider.dart';
import '../providers/theme_provider.dart';

class AppAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const AppAppBar({super.key, this.title, this.subTitle});

  final String? title;
  final String? subTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUser = ref.watch(supabaseUserProvider);
    final storeDetailsAsync = ref.watch(storeDetailsProvider);
    final themeMode = ref.watch(themeNotifierProvider);

    final theme = context.theme;
    return asyncUser.maybeWhen(
      data: (user) {
        return SafeArea(
          child: ListTile(
            dense: true,
            tileColor: theme.colorScheme.surface,
            shape: RoundedRectangleBorder(borderRadius: 8.circular),
            title: Text(
              title ??
                  storeDetailsAsync.maybeWhen(
                    orElse: () => 'Loading...',
                    data: (store) => store?['name'],
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
              ),
            ),
            subtitle: Text(
              subTitle ??
                  storeDetailsAsync.maybeWhen(
                    orElse: () => 'Loading...',
                    data: (store) => store?['address'],
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                themeMode == ThemeMode.dark
                    ? Icons.light_mode_rounded
                    : Icons.dark_mode_rounded,
              ),
              onPressed: ref.read(themeNotifierProvider.notifier).toggleTheme,
            ),
            contentPadding: EdgeInsets.zero,
            leading: IconButton(
              onPressed: () {},
              iconSize: 28.r,
              icon: const Icon(HugeIcons.strokeRoundedArrowLeft02),
            ),
          ),
        );
      },
      orElse: () => const SizedBox.shrink(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
