import 'package:flutter/material.dart';
import 'package:pokedex/core/design_system/imports.dart';

class AppBarDesktop extends StatelessWidget implements PreferredSizeWidget {
  final int currentIndex;
  final Function(int) onTap;

  const AppBarDesktop({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 12),
          AppImage.png(PngImgs.logo, height: 60),
          Row(
            children: [
              AppNavbar(
                currentIndex: currentIndex,
                onTap: (index) => onTap(index),
                isMobile: false,
              ),
              Spacer(),
              AppActions(onSettingsPressed: () {}, onNotificationsPressed: () {}, isMobile: false),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(146 + 12);
}
