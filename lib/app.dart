import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_gate.dart';
import 'providers/theme_provider.dart';
import 'themes/global_theme_data.dart';

class App extends ConsumerWidget  {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Watch the current theme mode
    final themeMode = ref.watch(themeNotifierProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Store Management App',
      themeMode: themeMode,
      theme: GlobalThemData.lightThemeData,
      darkTheme: GlobalThemData.darkThemeData,
      home: const AuthGate(),
    );
  }
}