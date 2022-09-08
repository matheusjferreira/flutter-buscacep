import 'package:flutter/material.dart';

enum AppTheme {
  darkTheme,
  lightTheme,
}

extension AppThemeExtension on AppTheme {
  ThemeData get getTheme {
    switch (this) {
      case AppTheme.darkTheme:
        return ThemeData.dark();
      case AppTheme.lightTheme:
        return ThemeData.light();
    }
  }
}
