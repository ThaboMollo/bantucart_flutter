import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData light = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0B6E4F)),
    scaffoldBackgroundColor: const Color(0xFFF5F7F6),
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      elevation: 0,
    ),
  );
}
