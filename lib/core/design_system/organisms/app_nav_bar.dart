import 'package:flutter/material.dart';
import 'package:pokedex/core/design_system/imports.dart';

class AppNavbar extends StatelessWidget {
  final bool isMobile;
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return isMobile
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                AppNavItem(
                  icon: NavbarIcons.home,
                  label: 'Home',
                  isActive: currentIndex == 0,
                  onTap: () => onTap(0),
                  isMobile: isMobile,
                ),
                AppNavItem(
                  icon: NavbarIcons.favorites,
                  label: 'Favoritos',
                  isActive: currentIndex == 1,
                  onTap: () => onTap(1),
                  isMobile: isMobile,
                ),
                AppNavItem(
                  icon: NavbarIcons.profile,
                  label: 'Perfil',
                  isActive: currentIndex == 2,
                  onTap: () => onTap(2),
                  isMobile: isMobile,
                ),
              ],
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppNavItem(
                icon: NavbarIcons.home,
                label: 'Home',
                isActive: currentIndex == 0,
                onTap: () => onTap(0),
                isMobile: isMobile,
              ),
              AppNavItem(
                icon: NavbarIcons.favorites,
                label: 'Favoritos',
                isActive: currentIndex == 1,
                onTap: () => onTap(1),
                isMobile: isMobile,
              ),
              AppNavItem(
                icon: NavbarIcons.profile,
                label: 'Perfil',
                isActive: currentIndex == 2,
                onTap: () => onTap(2),
                isMobile: isMobile,
              ),
            ],
          );
  }
}
