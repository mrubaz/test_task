import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppFonts {
  static TextStyle get heading => GoogleFonts.mulish(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.textMain,
      );

  static TextStyle get body => GoogleFonts.mulish(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppColors.textMain,
      );

  static TextStyle get button => GoogleFonts.mulish(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.background,
      );

  static TextStyle get navLabel => GoogleFonts.mulish(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      );
}
