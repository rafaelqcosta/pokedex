import 'package:flutter/material.dart';
import 'package:pokedex/core/design_system/imports.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 38),
          child: AppText.semiBold('Meu Perfil', size: 32),
        ),
        Expanded(child: Center(child: Text('Em desenvolvimento'))),
      ],
    );
  }
}
