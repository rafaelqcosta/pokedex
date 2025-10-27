import 'package:flutter/material.dart';
import 'package:pokedex/core/design_system/imports.dart';

class AppNavbar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppNavbar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AppNavItem(
            icon: const Icon(Icons.home_outlined),
            label: 'Home',
            isActive: currentIndex == 0,
            onTap: () => onTap(0),
          ),
          AppNavItem(
            icon: const Icon(Icons.catching_pokemon_outlined),
            label: 'Favoritos',
            isActive: currentIndex == 1,
            onTap: () => onTap(1),
          ),
          AppNavItem(
            icon: const Icon(Icons.person_outline),
            label: 'Perfil',
            isActive: currentIndex == 2,
            onTap: () => onTap(2),
          ),
        ],
      ),
    );
  }
}
