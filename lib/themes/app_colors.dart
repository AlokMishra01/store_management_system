import 'package:flutter/material.dart';

abstract class AppColors {
  Color get primary;
  Color get onPrimary;
  Color get secondary;
  Color get onSecondary;
  Color get error;
  Color get onError;
  Color get surface;
  Color get onSurface;
  Color get success;
  Color get onSuccess;
  Color get darkText;
  Color get lightText;
  Color get extraLightText;
}

class AppColorsLight implements AppColors {
  @override
  Color get primary => const Color(0xFFFFD300);

  @override
  Color get onPrimary => const Color(0xFF292D2F);

  @override
  Color get secondary => const Color(0xFFFFE366);

  @override
  Color get onSecondary => const Color(0xFF949494);

  @override
  Color get surface => const Color(0xFFFAF8EA);

  @override
  Color get onSurface => const Color(0xFFf4D666);

  @override
  Color get error => const Color(0xFFEE4E4E);

  @override
  Color get onError => const Color(0xFFFFFFFF);

  @override
  Color get success => const Color(0xFF059212);

  @override
  Color get onSuccess => const Color(0xFFFFFFFF);

  @override
  Color get darkText => const Color(0xFF2C2C2C);

  @override
  Color get lightText => const Color(0xFF989898);

  @override
  Color get extraLightText => const Color(0xFFBCBCBC);
}

// class AppColorsDark implements AppColorsVars {
// }
