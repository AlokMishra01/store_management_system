import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../auth_gate.dart';
import '../screens/home_screen.dart';
import 'auth_provider.dart';

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    final authState = ref.watch(authStateProvider);

    return GoRouter(
      initialLocation: '/',
      redirect: (context, state) {
        authState.whenOrNull(data: (session) {
          if (session != null) return '/login';
        });
        return null;
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (_, state) => const AuthGate(),
        ),
        GoRoute(
          path: '/home',
          builder: (_, state) => const HomeScreen(),
        ),
      ],
    );
  },
);
