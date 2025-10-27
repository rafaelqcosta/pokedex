import 'package:flutter/material.dart';

/// Gradientes padronizados do Design System.
/// Inclui os degradês de acessibilidade conforme o guideline de cores.
class AppGradients {
  AppGradients._();

  /// Gradiente vermelho de acessibilidade (#EBB753 → #C60000)
  static const LinearGradient accessibilityRed = LinearGradient(
    colors: [
      Color(0xFFEBB753), // topo
      Color(0xFFC60000), // base
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  /// Gradiente amarelo de acessibilidade (#FCF47C → #BC8905)
  static const LinearGradient accessibilityYellow = LinearGradient(
    colors: [Color(0xFFFCF47C), Color(0xFFBC8905)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  /// Gradiente ciano de acessibilidade (#20C5F5 → #157C9A)
  static const LinearGradient accessibilityCyan = LinearGradient(
    colors: [Color(0xFF20C5F5), Color(0xFF157C9A)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  /// Gradiente verde de acessibilidade (#70D090 → #55A23A)
  static const LinearGradient accessibilityGreen = LinearGradient(
    colors: [Color(0xFF70D090), Color(0xFF55A23A)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
