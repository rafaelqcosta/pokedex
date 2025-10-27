import 'package:flutter/material.dart';
import 'package:pokedex/core/design_system/imports.dart';

class AppNavItem extends StatelessWidget {
  final Widget icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const AppNavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isActive ? AppColors.red : AppColors.gray3;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconTheme(
              data: IconThemeData(color: color, size: 26),
              child: icon,
            ),
            const SizedBox(height: 4),
            AppText.regular(label, size: 12, color: color),
          ],
        ),
      ),
    );
  }
}
