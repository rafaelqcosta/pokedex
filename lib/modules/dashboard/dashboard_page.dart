import 'package:flutter/material.dart';
import 'package:pokedex/app_widget.dart';
import 'package:pokedex/core/design_system/imports.dart';
import 'package:pokedex/modules/favorites/pages/favorites_page.dart';
import 'package:pokedex/modules/home/presentation/pages/home_page.dart';
import 'package:pokedex/modules/profile/pages/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final pages = const [HomePage(), FavoritesPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isMobile,
      builder: (context, isMobile, child) {
        return Scaffold(
          appBar: isMobile
              ? AppBarMobile()
              : AppBarDesktop(
                  currentIndex: currentIndex,
                  onTap: (index) => setState(() => currentIndex = index),
                ),
          body: IndexedStack(index: currentIndex, children: pages),

          bottomNavigationBar: isMobile
              ? AppNavbar(
                  currentIndex: currentIndex,
                  onTap: (index) => setState(() => currentIndex = index),
                  isMobile: isMobile,
                )
              : const SizedBox.shrink(),
        );
      },
    );
  }
}
