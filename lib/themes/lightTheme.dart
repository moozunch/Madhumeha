import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFFF14647), //0xFF + warna pilihan
  scaffoldBackgroundColor: Colors.white,
  secondaryHeaderColor: Color(0xFF1F272D),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Color(0xFF1F272D),
    ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Color(0xFF1F272D) //BodyHitam
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Color(0xFFF14647) //BodyPink
    ),
      bodySmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Color(0xCC1F272D) //hitam 80%
      ),
  )
);