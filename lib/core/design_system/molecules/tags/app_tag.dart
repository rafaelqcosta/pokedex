import 'package:flutter/material.dart';
import 'package:pokedex/core/design_system/imports.dart';

class AppTag extends StatelessWidget {
  final PokemonIcons type;
  final double iconSize;
  final EdgeInsets padding;

  const AppTag({
    super.key,
    required this.type,
    this.iconSize = 10,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(color: type.tagColor, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppIcon.pokemon(type, size: iconSize, color: AppColors.white),
          const SizedBox(width: 4),
          AppText.regular(type.label, size: 12, color: AppColors.white),
        ],
      ),
    );
  }
}
