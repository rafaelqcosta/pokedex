import 'package:flutter/material.dart';
import 'package:pokedex/core/design_system/imports.dart';

enum PokemonIcons {
  fire,
  bug,
  dark,
  dragon,
  electric,
  fairy,
  fighting,
  flying,
  ghost,
  grass,
  ground,
  ice,
  normal,
  poison,
  psychic,
  rock,
  steel,
  water,
}

extension PokemonIconsExtension on PokemonIcons {
  /// Label exibido na tag
  String get label {
    switch (this) {
      case PokemonIcons.fire:
        return 'Fire';
      case PokemonIcons.bug:
        return 'Bug';
      case PokemonIcons.dark:
        return 'Dark';
      case PokemonIcons.dragon:
        return 'Dragon';
      case PokemonIcons.electric:
        return 'Electric';
      case PokemonIcons.fairy:
        return 'Fairy';
      case PokemonIcons.fighting:
        return 'Fighting';
      case PokemonIcons.flying:
        return 'Flying';
      case PokemonIcons.ghost:
        return 'Ghost';
      case PokemonIcons.grass:
        return 'Grass';
      case PokemonIcons.ground:
        return 'Ground';
      case PokemonIcons.ice:
        return 'Ice';
      case PokemonIcons.normal:
        return 'Normal';
      case PokemonIcons.poison:
        return 'Poison';
      case PokemonIcons.psychic:
        return 'Psychic';
      case PokemonIcons.rock:
        return 'Rock';
      case PokemonIcons.steel:
        return 'Steel';
      case PokemonIcons.water:
        return 'Water';
    }
  }

  /// Cor de fundo da tag
  Color get tagColor {
    switch (this) {
      case PokemonIcons.fire:
        return AppColors.red;
      case PokemonIcons.bug:
        return AppColors.green3;
      case PokemonIcons.dark:
        return AppColors.navy;
      case PokemonIcons.dragon:
        return AppColors.darkBlue;
      case PokemonIcons.electric:
        return AppColors.orange2;
      case PokemonIcons.fairy:
        return AppColors.pink1;
      case PokemonIcons.fighting:
        return AppColors.black;
      case PokemonIcons.flying:
        return AppColors.lightBlue2;
      case PokemonIcons.ghost:
        return AppColors.gray4;
      case PokemonIcons.grass:
        return AppColors.green1;
      case PokemonIcons.ground:
        return AppColors.brown2;
      case PokemonIcons.ice:
        return AppColors.lightBlue1;
      case PokemonIcons.normal:
        return AppColors.brown3;
      case PokemonIcons.poison:
        return AppColors.purple3;
      case PokemonIcons.psychic:
        return AppColors.purple1;
      case PokemonIcons.rock:
        return AppColors.brown1;
      case PokemonIcons.steel:
        return AppColors.gray2;
      case PokemonIcons.water:
        return AppColors.blue;
    }
  }

  /// Cor de fundo do card
  Color get cardColor {
    switch (this) {
      case PokemonIcons.fire:
        return AppColors.orange1;
      case PokemonIcons.bug:
        return AppColors.green4;
      case PokemonIcons.dark:
        return AppColors.purple2;
      case PokemonIcons.dragon:
        return AppColors.skyBlue;
      case PokemonIcons.electric:
        return AppColors.yellow;
      case PokemonIcons.fairy:
        return AppColors.pink3;
      case PokemonIcons.fighting:
        return AppColors.gray6;
      case PokemonIcons.flying:
        return AppColors.lightBlue2;
      case PokemonIcons.ghost:
        return AppColors.gray7;
      case PokemonIcons.grass:
        return AppColors.green2;
      case PokemonIcons.ground:
        return AppColors.brown4;
      case PokemonIcons.ice:
        return AppColors.lightBlue1;
      case PokemonIcons.normal:
        return AppColors.peach;
      case PokemonIcons.poison:
        return AppColors.pink2;
      case PokemonIcons.psychic:
        return AppColors.purple4;
      case PokemonIcons.rock:
        return AppColors.brown5;
      case PokemonIcons.steel:
        return AppColors.gray5;
      case PokemonIcons.water:
        return AppColors.cyan;
    }
  }
}
