import 'package:flutter/material.dart';
import 'package:pokedex/core/design_system/imports.dart';
import 'package:pokedex/core/utils/parse_utils.dart';

extension AppText on Text {
  static TextStyle get defaultStyle => const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
    height: 1.2,
    decoration: TextDecoration.none,
  );

  static Text _buildText(
    String data, {
    required FontWeight weight,
    double size = 14,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? height,
    TextDecoration? decoration,
    String? fontFamily,
  }) {
    return Text(
      capitalize(data),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontFamily: fontFamily ?? 'Roboto',
        fontSize: size,
        fontWeight: weight,
        color: color ?? AppColors.black,
        height: height,
        decoration: decoration,
      ),
    );
  }

  static Text regular(
    String data, {
    double size = 14,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? height,
    TextDecoration? decoration,
    String? fontFamily,
  }) => _buildText(
    capitalize(data),
    weight: FontWeight.w400,
    size: size,
    color: color,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
    height: height,
    decoration: decoration,
    fontFamily: fontFamily,
  );

  static Text medium(
    String data, {
    double size = 14,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? height,
    TextDecoration? decoration,
    String? fontFamily,
  }) => _buildText(
    capitalize(data),
    weight: FontWeight.w500,
    size: size,
    color: color,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
    height: height,
    decoration: decoration,
    fontFamily: fontFamily,
  );

  static Text semiBold(
    String data, {
    double size = 14,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? height,
    TextDecoration? decoration,
    String? fontFamily,
  }) => _buildText(
    capitalize(data),
    weight: FontWeight.w600,
    size: size,
    color: color,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
    height: height,
    decoration: decoration,
    fontFamily: fontFamily,
  );

  static Text bold(
    String data, {
    double size = 14,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? height,
    TextDecoration? decoration,
    String? fontFamily,
  }) => _buildText(
    capitalize(data),
    weight: FontWeight.w700,
    size: size,
    color: color,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
    height: height,
    decoration: decoration,
    fontFamily: fontFamily,
  );

  static Text extraBold(
    String data, {
    double size = 14,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? height,
    TextDecoration? decoration,
    String? fontFamily,
  }) => _buildText(
    capitalize(data),
    weight: FontWeight.w800,
    size: size,
    color: color,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
    height: height,
    decoration: decoration,
    fontFamily: fontFamily,
  );
}
