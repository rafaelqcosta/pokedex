import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/core/design_system/imports.dart';

class AppIcon {
  AppIcon._();

  static const String _pokemonBasePath = 'assets/icons/pokemons';
  static const String _navbarBasePath = 'assets/icons/navbar';
  static const String _othersBasePath = 'assets/icons/others';

  static String _pokemonPath(PokemonIcons icon) => '$_pokemonBasePath/${icon.name}.svg';

  static String _otherPath(OtherIcons icon) => '$_othersBasePath/${icon.name}.svg';

  static String _navbarPath(NavbarIcons icon) => '$_navbarBasePath/${icon.name}.svg';

  static Widget pokemon(
    PokemonIcons icon, {
    double size = 24,
    Color? color,
    BoxFit fit = BoxFit.contain,
  }) {
    return SvgPicture.asset(
      _pokemonPath(icon),
      width: size,
      height: size,
      fit: fit,
      colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
    );
  }

  static Widget navbar(
    NavbarIcons icon, {
    double size = 24,
    Color? color,
    BoxFit fit = BoxFit.contain,
  }) {
    return SvgPicture.asset(
      _navbarPath(icon),
      width: size,
      height: size,
      fit: fit,
      colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
    );
  }

  static Widget others(
    OtherIcons icon, {
    double size = 24,
    Color? color,
    BoxFit fit = BoxFit.contain,
  }) {
    return SvgPicture.asset(
      _otherPath(icon),
      width: size,
      height: size,
      fit: fit,
      colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
    );
  }
}
