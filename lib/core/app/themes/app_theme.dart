import 'package:flutter/material.dart';
import 'package:sit_todos/core/app/styles/app_color.dart';
import 'package:sit_todos/core/app/themes/app_input_theme.dart';

import '../styles/app_text_style.dart';
import 'app_button_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData getDefaultTheme() {
    return ThemeData(
      textTheme: AppTextStyle.theme,
      elevatedButtonTheme: AppButtonTheme.elevated,
      outlinedButtonTheme: AppButtonTheme.outlined,
      textButtonTheme: AppButtonTheme.text,
      inputDecorationTheme: AppInputTheme.getTheme(),
      colorScheme: AppColor.scheme,
    );
  }
}
