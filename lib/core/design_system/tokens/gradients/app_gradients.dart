import 'package:flutter/material.dart';

class AppGradients {
  AppGradients._();

  static const LinearGradient gradientRed = LinearGradient(
    colors: [Color(0xFFEBB753), Color(0xFFC60000)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient gradientYellow = LinearGradient(
    colors: [Color(0xFFFCF47C), Color(0xFFBC8905)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient gradientBlue = LinearGradient(
    colors: [Color(0xFF20C5F5), Color(0xFF157C9A)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient gradientGreen = LinearGradient(
    colors: [Color(0xFF70D090), Color(0xFF55A23A)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
