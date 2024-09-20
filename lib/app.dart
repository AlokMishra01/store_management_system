import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'auth_gate.dart';
import 'providers/theme_provider.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Watch the current theme mode
    final themeMode = ref.watch(themeNotifierProvider);

    return ScreenUtilInit(
      designSize: const Size(402, 874),
      minTextAdapt: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Store Management App',
          themeMode: themeMode,
          theme: FlexThemeData.light(
            scheme: FlexScheme.jungle,
            textTheme: GoogleFonts.notoSansTextTheme(),
          ),
          darkTheme: FlexThemeData.dark(
            scheme: FlexScheme.jungle,
            textTheme: GoogleFonts.notoSansTextTheme(),
          ),
          home: child,
        );
      },
      child: const AuthGate(),
    );
  }
}
