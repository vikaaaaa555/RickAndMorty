import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle get white12Normal => GoogleFonts.exo2(
      textStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Colors.white,
          letterSpacing: 0.07)
  );


  static TextStyle get white16Medium => GoogleFonts.exo2(
      textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
          letterSpacing: 0.07)
  );

  static TextStyle get white18SemiBoldItalic => GoogleFonts.exo2(
      textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic,
          color: Colors.white,
          letterSpacing: 0.07)
  );

  static TextStyle get white22Bold => GoogleFonts.exo2(
      textStyle: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: Colors.white,
          letterSpacing: 0.07)
  );
}
