import 'package:flutter/material.dart';

/// A class to hold all the color constants for the app.
/// This prevents magic strings and provides a single source of truth for colors.
class AppColors {
  // This class is not meant to be instantiated.
  AppColors._();

  // --- Primary Palette ---
  static const Color primary = Color(0xFF6A5AE0);
  static const Color secondary = Color(0xFF9E8BFF);
  static const Color accent = Color(0xFF23E0C3);

  // --- Neutrals ---
  static const Color black = Color(0xFF121212);
  static const Color darkestGrey = Color(0xFF212121);
  static const Color darkGrey = Color(0xFF333333);
  static const Color mediumGrey = Color(0xFF616161);
  static const Color lightGrey = Color(0xFFE0E0E0);
  static const Color lightestGrey = Color(0xFFF5F5F5);
  static const Color white = Color(0xFFFFFFFF);

  // --- Semantic Colors ---
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFD32F2F);
  static const Color warning = Color(0xFFFFA000);
  static const Color info = Color(0xFF1976D2);
}
