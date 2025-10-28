import 'package:flutter/material.dart';
import 'package:pokedex/core/design_system/imports.dart';

class AppNavItem extends StatelessWidget {
  final Widget icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  final bool isMobile;

  const AppNavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final color = isActive ? AppColors.red : AppColors.gray3;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: isMobile
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconTheme(
                    data: IconThemeData(color: color, size: 28),
                    child: icon,
                  ),
                  const SizedBox(height: 4),
                  AppText.regular(label, size: 12, color: color),
                ],
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconTheme(
                    data: IconThemeData(color: color, size: 28),
                    child: icon,
                  ),
                  const SizedBox(width: 8),
                  AppText.semiBold(label, size: 24, color: color),
                ],
              ),
      ),
    );
  }
}
