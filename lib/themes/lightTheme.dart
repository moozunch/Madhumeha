import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFFF14647), //0xFF + warna pilihan
  scaffoldBackgroundColor: Colors.white,
  secondaryHeaderColor: Color(0xFF1F272D),
  primaryColorDark: Color(0x991F272D), //12% Hitam
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.plusJakartaSans(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Color(0xFF1F272D),
    ),
    bodyMedium: GoogleFonts.plusJakartaSans(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Color(0xFF1F272D), // BodyHitam
    ),
    bodyLarge: GoogleFonts.plusJakartaSans(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Color(0xFFF14647), // BodyPink
    ),
    bodySmall: GoogleFonts.plusJakartaSans(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Color(0xCC1F272D), // Hitam 80%
    ),
  ),
);