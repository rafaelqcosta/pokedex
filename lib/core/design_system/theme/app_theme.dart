import 'package:flutter/material.dart';
import 'package:pokedex/core/design_system/imports.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(useMaterial3: true, colorScheme: AppColorSchemes.light);

  static ThemeData get dark => ThemeData(useMaterial3: true, colorScheme: AppColorSchemes.dark);
}
