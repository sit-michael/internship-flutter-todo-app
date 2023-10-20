import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  static const ColorScheme scheme = ColorScheme(
    brightness: Brightness.light,
    background: AppColor.background,
    onBackground: AppColor.white,
    error: AppColor.error,
    onError: AppColor.white,
    primary: AppColor.primary,
    onPrimary: AppColor.background,
    secondary: AppColor.background,
    onSecondary: AppColor.white,
    surface: AppColor.background,
    onSurface: AppColor.white,
  );

  static const Color white = Color(0xFFFFFFFF);
  static const Color grey200 = Color(0xFFDDDDDD);
  static const Color grey400 = Color(0xFF777777);
  static const Color grey600 = Color(0xFF444444);
  static const Color black = Color(0xFF000000);

  static const Color primary = Color(0xFF00C3CD);
  static const Color primary600 = Color(0xFF008087);
  static const Color background = Color(0xFF0A1E2D);
  static const Color error = Colors.red;

  static const Color cardBackground = Color(0xFFFFFFFF);
}
