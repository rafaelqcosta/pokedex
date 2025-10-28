import 'package:flutter/material.dart';
import 'package:pokedex/core/design_system/imports.dart';

class AppActions extends StatelessWidget {
  final VoidCallback? onSettingsPressed;
  final VoidCallback? onNotificationsPressed;
  final bool isMobile;

  const AppActions({
    super.key,
    this.onSettingsPressed,
    this.onNotificationsPressed,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          isMobile ? _buildSettings() : _buildNotifications(),

          isMobile ? const Spacer() : const SizedBox(width: 40),

          isMobile ? _buildNotifications() : _buildSettings(),
        ],
      ),
    );
  }

  AppIconButton _buildNotifications() {
    return AppIconButton(
      icon: AppIcon.others(OtherIcons.bell, size: 26, color: AppColors.gray3),
      onTap: onNotificationsPressed,
    );
  }

  AppIconButton _buildSettings() {
    return AppIconButton(
      icon: AppIcon.others(OtherIcons.gear, size: 26, color: AppColors.gray3),
      onTap: onSettingsPressed,
    );
  }
}
