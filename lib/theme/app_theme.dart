import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: Colors.blue,
      background: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white,
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: Colors.blue,
      background: Colors.black,
    ),
    scaffoldBackgroundColor: Colors.black,
  );
}
