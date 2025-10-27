import 'package:flutter/material.dart';
import 'package:pokedex/core/design_system/imports.dart';

class HeaderMobile extends StatelessWidget {
  final Widget child;
  const HeaderMobile({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBarHome(onSettingsPressed: () {}, onNotificationsPressed: () {}),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 18),
                child: Column(
                  spacing: 56,
                  children: [
                    AppImage.png(PngImgs.logo),
                    Expanded(child: child),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
