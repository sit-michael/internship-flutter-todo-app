import 'package:flutter/material.dart';

import '../../core/app/styles/app_color.dart';

class CustomSnackbar extends SnackBar {
  CustomSnackbar({super.key, required String label})
      : super(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
            content: Chip(
              backgroundColor: AppColor.grey300,
              label: Text(label),
            ));
}
