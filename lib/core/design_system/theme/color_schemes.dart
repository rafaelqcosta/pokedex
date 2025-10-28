import 'package:flutter/material.dart';
import 'package:pokedex/core/design_system/imports.dart';

/// Esquemas de cores para temas claro e escuro
class AppColorSchemes {
  AppColorSchemes._();

  /// Color scheme para tema claro
  static const ColorScheme light = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.blue,
    onPrimary: AppColors.white,
    primaryContainer: AppColors.lightBlue1,
    onPrimaryContainer: AppColors.navy,
    secondary: AppColors.green3,
    onSecondary: AppColors.white,
    secondaryContainer: AppColors.green2,
    onSecondaryContainer: AppColors.green1,
    tertiary: AppColors.purple3,
    onTertiary: AppColors.white,
    tertiaryContainer: AppColors.purple4,
    onTertiaryContainer: AppColors.purple1,
    error: AppColors.red,
    onError: AppColors.white,
    errorContainer: AppColors.peach,
    onErrorContainer: AppColors.brown2,
    surface: AppColors.white,
    onSurface: AppColors.black,
    surfaceContainerHighest: AppColors.gray7,
    onSurfaceVariant: AppColors.gray1,
    outline: AppColors.gray4,
    outlineVariant: AppColors.gray6,
    shadow: AppColors.black,
    scrim: AppColors.black,
    inverseSurface: AppColors.gray1,
    onInverseSurface: AppColors.white,
    inversePrimary: AppColors.lightBlue1,
    surfaceTint: AppColors.blue,
  );

  /// Color scheme para tema escuro
  static const ColorScheme dark = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.lightBlue1,
    onPrimary: AppColors.navy,
    primaryContainer: AppColors.darkBlue,
    onPrimaryContainer: AppColors.skyBlue,
    secondary: AppColors.green2,
    onSecondary: AppColors.green1,
    secondaryContainer: AppColors.green1,
    onSecondaryContainer: AppColors.green4,
    tertiary: AppColors.purple4,
    onTertiary: AppColors.purple1,
    tertiaryContainer: AppColors.purple1,
    onTertiaryContainer: AppColors.purple4,
    error: AppColors.red,
    onError: AppColors.white,
    errorContainer: AppColors.brown2,
    onErrorContainer: AppColors.peach,
    surface: AppColors.gray1,
    onSurface: AppColors.white,
    surfaceContainerHighest: AppColors.gray2,
    onSurfaceVariant: AppColors.gray7,
    outline: AppColors.gray4,
    outlineVariant: AppColors.gray3,
    shadow: AppColors.black,
    scrim: AppColors.black,
    inverseSurface: AppColors.gray7,
    onInverseSurface: AppColors.black,
    inversePrimary: AppColors.blue,
    surfaceTint: AppColors.lightBlue1,
  );
}
