import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(0xFFAD1F20), //0xFF + warna pilihan
    scaffoldBackgroundColor: Color(0xFF1F272D),
    textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1F272D),
        ),
        bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.white //BodyPutih
        ),
        bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Color(0xFFAD1F20) //BodyPink
        ),
        bodySmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Color(0xCC1F272D) //hitam 80%
        ),
    )
);