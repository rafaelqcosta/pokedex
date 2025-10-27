import 'package:flutter/material.dart';
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
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: pages),
      bottomNavigationBar: AppNavbar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}
