import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension CustomTextStyle on TextStyle {
  static final TextStyle displayLarge =
      GoogleFonts.josefinSans(fontWeight: FontWeight.w300, letterSpacing: -1.5);
  static final TextStyle displayMedium =
      GoogleFonts.josefinSans(fontWeight: FontWeight.w300, letterSpacing: -0.5);
  static final displaySmall = GoogleFonts.josefinSans(
    fontWeight: FontWeight.w800,
  );
  static final TextStyle headlineMedium =
      GoogleFonts.josefinSans(fontWeight: FontWeight.w600, letterSpacing: 0.25);

  static final TextStyle headlineSmall =
      GoogleFonts.josefinSans(fontWeight: FontWeight.w500);
  static final TextStyle titleLarge =
      GoogleFonts.josefinSans(fontWeight: FontWeight.w600, letterSpacing: 0.15);
  static final TextStyle titleMedium =
      GoogleFonts.josefinSans(fontWeight: FontWeight.w400, letterSpacing: 0.1);
  static final TextStyle titleSmall =
      GoogleFonts.josefinSans(fontWeight: FontWeight.w500, letterSpacing: 0.1);
  static final TextStyle bodyLarge =
      GoogleFonts.josefinSans(fontWeight: FontWeight.w400, letterSpacing: 0.5);
  static final TextStyle bodyMedium =
      GoogleFonts.josefinSans(fontWeight: FontWeight.w400, letterSpacing: 0.25);
  static final TextStyle labelLarge =
      GoogleFonts.josefinSans(fontWeight: FontWeight.w500, letterSpacing: 1.25);
  static final TextStyle bodySmall =
      GoogleFonts.josefinSans(fontWeight: FontWeight.w400, letterSpacing: 0.4);
  static final TextStyle labelSmall =
      GoogleFonts.josefinSans(fontWeight: FontWeight.w400, letterSpacing: 0.4);
}
