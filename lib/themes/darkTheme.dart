import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Color(0xFFAD1F20), //0xFF + warna pilihan
  scaffoldBackgroundColor: Color(0xFF1F272D),
  secondaryHeaderColor: Colors.white,
  primaryColorDark: Color(0x99FFFFFF), //12% Putih
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.plusJakartaSans(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Color(0xFF1F272D),
    ),
    bodyMedium: GoogleFonts.plusJakartaSans(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Colors.white, //BodyPutih
    ),
    bodyLarge: GoogleFonts.plusJakartaSans(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Color(0xFFAD1F20), //BodyPink
    ),
    bodySmall: GoogleFonts.plusJakartaSans(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Color(0xCC1F272D), //hitam 80%
    ),
  ),
);

// final TextStyle heading = GoogleFonts.plusJakartaSans(
//   fontSize: 24,
//   fontWeight: FontWeight.bold,
//   color: Colors.white,
// );
