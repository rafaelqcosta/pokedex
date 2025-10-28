import 'package:flutter/material.dart';
import 'package:pokedex/app_widget.dart';
import 'package:pokedex/core/design_system/imports.dart';

class AppHeaderTitle extends StatelessWidget {
  final String title;

  const AppHeaderTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isMobile.value
          ? const EdgeInsets.only(left: 38, right: 38, top: 56, bottom: 32)
          : EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.07,
              right: MediaQuery.of(context).size.width * 0.05,
              top: 80,
              bottom: 80,
            ),
      child: Row(children: [Expanded(child: AppText.semiBold(title, size: 32))]),
    );
  }
}
