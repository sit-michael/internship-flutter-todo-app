import 'package:flutter/material.dart';
import 'package:udemy_flutter_bloc_tasks/core/app/styles/app_color.dart';

import '../styles/app_text_style.dart';
import 'app_button_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData getDefaultTheme() {
    return ThemeData(
      textTheme: AppTextStyle.theme,
      elevatedButtonTheme: AppButtonTheme.elevated,
      outlinedButtonTheme: AppButtonTheme.outlined,
      colorScheme: AppColor.scheme,
    );
  }
}
