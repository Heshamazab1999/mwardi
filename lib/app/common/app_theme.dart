import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static get appTheme => ThemeData(
      colorScheme: _customColorScheme,
      appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          foregroundColor: AppColors.blackColor,
          shadowColor: AppColors.blackColor.withAlpha(50)));

  static final ColorScheme _customColorScheme = ColorScheme(
    primary: AppColors.primaryColor,
    secondary: AppColors.secondaryColor,
    surface: AppColors.backgroundColor,
    background: AppColors.backgroundColor,
    onError: AppColors.blackColor,
    brightness: Brightness.light,
    error: AppColors.redColor,
    onBackground: AppColors.blackColor,
    onPrimary: AppColors.whiteColor,
    onSecondary: AppColors.primaryColor,
    onSurface: AppColors.primaryColor,
  );
}
