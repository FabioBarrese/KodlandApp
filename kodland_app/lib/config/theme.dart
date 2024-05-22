import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    fontFamily: 'Kaleko',
    textTheme: textTheme(),
  );
}

TextTheme textTheme(){
  return const TextTheme(
    headlineLarge: TextStyle(
      color: Colors.black,
      fontSize: 48,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: TextStyle(
      color: Colors.black,
      fontSize: 10,
      fontWeight: FontWeight.normal,
    ),
  );
}