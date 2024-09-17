import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_gate.dart';
import 'providers/theme_provider.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Watch the current theme mode
    final themeMode = ref.watch(themeNotifierProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Store Management App',
      themeMode: themeMode,
      theme: FlexThemeData.light(scheme: FlexScheme.jungle),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.jungle),
      home: const AuthGate(),
    );
  }
}
