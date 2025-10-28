import 'package:flutter/material.dart';
import 'package:pokedex/core/design_system/imports.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppHeaderTitle(title: 'Tela de Perfil'),
        Expanded(child: Center(child: Text('Em desenvolvimento'))),
      ],
    );
  }
}
