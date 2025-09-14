import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Defines the typography for the application.
/// Uses the 'Manrope' font for its clean and modern aesthetic.
class AppTypography {
  AppTypography._();

  /// The main text theme for the application.
  static final TextTheme textTheme = TextTheme(
    displayLarge: GoogleFonts.manrope(
      fontSize: 57,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: GoogleFonts.manrope(
      fontSize: 45,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: GoogleFonts.manrope(
      fontSize: 36,
      fontWeight: FontWeight.bold,
    ),
    headlineLarge: GoogleFonts.manrope(
      fontSize: 32,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: GoogleFonts.manrope(
      fontSize: 28,
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: GoogleFonts.manrope(
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
    titleLarge: GoogleFonts.manrope(fontSize: 22, fontWeight: FontWeight.w600),
    titleMedium: GoogleFonts.manrope(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.15,
    ),
    titleSmall: GoogleFonts.manrope(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
    ),
    bodyLarge: GoogleFonts.manrope(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      letterSpacing: 0.5,
    ),
    bodyMedium: GoogleFonts.manrope(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      letterSpacing: 0.25,
    ),
    bodySmall: GoogleFonts.manrope(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      letterSpacing: 0.4,
    ),
    labelLarge: GoogleFonts.manrope(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.1,
    ),
    labelMedium: GoogleFonts.manrope(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
    ),
    labelSmall: GoogleFonts.manrope(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
    ),
  );
}
