import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Colors.indigo;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: primaryColor,
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: primaryColor,
    ),
    scaffoldBackgroundColor: Colors.black,
  );
}
