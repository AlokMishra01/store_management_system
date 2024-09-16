import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store_management_system/providers/auth_provider.dart';
import 'package:store_management_system/themes/app_colors.dart';
import 'package:store_management_system/widgets/app_bottom_navigation_bar.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.read(authProvider);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColorsLight().onSuccess,
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await authService.signOut();
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Welcome to the Inventory App!'),
      ),
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }
}
