import 'package:flutter/material.dart';
import 'package:pokedex/core/design_system/imports.dart';

class AppBarMobile extends StatelessWidget implements PreferredSizeWidget {
  const AppBarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SizedBox(
        height: 90,
        child: Stack(
          children: [
            AppActions(onSettingsPressed: () {}, onNotificationsPressed: () {}, isMobile: true),
            Positioned(left: 0, right: 0, top: 30, child: AppImage.png(PngImgs.logo, height: 60)),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90);
}
