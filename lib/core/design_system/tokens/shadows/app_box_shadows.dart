import 'package:flutter/material.dart';
import 'package:pokedex/core/design_system/imports.dart';

final appBoxShadows = [
  // Sombra 1 — esquerda inferior
  BoxShadow(
    color: AppColors.black.withOpacity(0.25),
    offset: const Offset(-2, 4),
    blurRadius: 4,
    spreadRadius: 0,
  ),
  // Sombra 2 — direita leve
  BoxShadow(
    color: AppColors.black.withOpacity(0.25),
    offset: const Offset(2, 0),
    blurRadius: 4,
    spreadRadius: 0,
  ),
];
