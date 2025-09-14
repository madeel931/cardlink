import 'package:cardlink_ui_kit/core/constants/app_colors.dart';
import 'package:cardlink_ui_kit/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

/// Defines the application's themes for both light and dark modes.
class AppTheme {
  AppTheme._();

  /// The light theme configuration.
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: AppTypography.textTheme.bodyLarge?.fontFamily,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      error: AppColors.error,
      surface: AppColors.white, // ✅ keep surface for cards/dialogs
    ),
    scaffoldBackgroundColor: AppColors.lightestGrey, // ✅ use scaffoldBackground
    textTheme: AppTypography.textTheme.apply(
      bodyColor: AppColors.darkGrey,
      displayColor: AppColors.black,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.lightestGrey,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: AppTypography.textTheme.titleLarge?.copyWith(
        color: AppColors.black,
      ),
      iconTheme: const IconThemeData(color: AppColors.black),
    ),
  );

  /// The dark theme configuration.
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: AppTypography.textTheme.bodyLarge?.fontFamily,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
      primary: AppColors.secondary, // lighter primary for contrast
      secondary: AppColors.primary,
      error: AppColors.error,
      surface: AppColors.darkestGrey, // ✅ surface for dark mode
    ),
    scaffoldBackgroundColor: AppColors.black, // ✅ scaffold background
    textTheme: AppTypography.textTheme.apply(
      bodyColor: AppColors.lightGrey,
      displayColor: AppColors.white,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.black,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: AppTypography.textTheme.titleLarge?.copyWith(
        color: AppColors.white,
      ),
      iconTheme: const IconThemeData(color: AppColors.white),
    ),
  );
}
