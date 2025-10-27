import 'package:flutter/material.dart';
import 'package:pokedex/core/design_system/imports.dart';
import 'package:pokedex/core/design_system/tokens/shadows/app_box_shadows.dart';

class AppSnackbar extends StatelessWidget {
  final Widget icon;
  final String message;
  final Color borderColor;

  const AppSnackbar({
    super.key,
    required this.icon,
    required this.message,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor, width: 2),
          boxShadow: appBoxShadows,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [icon, const SizedBox(width: 7), AppText.regular(message, size: 10)],
        ),
      ),
    );
  }
}
