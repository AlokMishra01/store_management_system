import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/auth_provider.dart';
import 'providers/store/user_has_store_provider.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/store_screen.dart';

class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.when(
      data: (session) {
        if (session != null) {
          final storeExists = ref.watch(
            userHasStoreProvider(session.user.id),
          );
          return storeExists.when(
            data: (hasStore) {
              if (hasStore) {
                return const HomeScreen();
              } else {
                return const StoreScreen();
              }
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => Center(
              child: Text('Error: $error'),
            ),
          );
        } else {
          return const LoginScreen();
        }
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Text('Error: $error'),
      ),
    );
  }
}
