import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/auth_provider.dart';
import '../providers/theme_provider.dart';

class AppAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const AppAppBar({super.key, required this.title, this.actions});

  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.read(authProvider);
    final themeMode = ref.watch(themeNotifierProvider);
    return AppBar(
      title: Text(title),
      actions: [
        ...?actions,
        IconButton(
          icon: Icon(
            themeMode == ThemeMode.dark
                ? Icons.light_mode_rounded
                : Icons.dark_mode_rounded,
          ),
          onPressed: ref.read(themeNotifierProvider.notifier).toggleTheme,
        ),
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () async {
            await authService.signOut();
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
