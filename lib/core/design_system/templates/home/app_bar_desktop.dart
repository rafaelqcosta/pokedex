import 'package:flutter/material.dart';
import 'package:pokedex/core/design_system/imports.dart';

class AppBarDesktop extends StatelessWidget implements PreferredSizeWidget {
  final int currentIndex;
  final Function(int) onTap;

  const AppBarDesktop({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppImage.png(PngImgs.logo, height: 60),
        Row(
          children: [
            AppNavbar(currentIndex: currentIndex, onTap: (index) => onTap(index), isMobile: false),
            Spacer(),
            AppActions(onSettingsPressed: () {}, onNotificationsPressed: () {}, isMobile: false),
          ],
        ),
        // SafeArea(
        //   child: Align(
        //     alignment: Alignment.topCenter,
        //     child: Padding(
        //       padding: const EdgeInsets.only(top: 18),
        //       child: Column(spacing: 56, children: [Expanded(child: child)]),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(146);
}
