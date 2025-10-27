import 'package:flutter/material.dart';
import 'package:pokedex/core/design_system/imports.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onSettingsPressed;
  final VoidCallback? onNotificationsPressed;

  const AppBarHome({super.key, this.onSettingsPressed, this.onNotificationsPressed});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppIconButton(
              icon: AppIcon.others(OtherIcons.gear, size: 26, color: AppColors.gray3),
              onTap: onSettingsPressed,
            ),
            AppIconButton(
              icon: AppIcon.others(OtherIcons.bell, size: 26, color: AppColors.gray3),
              onTap: onNotificationsPressed,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(63);
}
