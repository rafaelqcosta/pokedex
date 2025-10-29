import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/app_widget.dart';
import 'package:pokedex/core/constants/constants.dart';
import 'package:pokedex/core/design_system/imports.dart';
import 'package:pokedex/core/utils/parse_utils.dart';
import 'package:pokedex/modules/home/domain/models/evolution_model.dart';

class PokemonEvolutionRow extends StatelessWidget {
  final List<EvolutionModel> evolutions;
  final PokemonIcons icon;

  const PokemonEvolutionRow({super.key, required this.evolutions, required this.icon});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width >= 640
        ? bottomSheetMaxWidth
        : MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (int i = 0; i < evolutions.length; i++) ...[
              Flexible(
                child: _EvolutionItem(pokemon: evolutions[i], icon: icon),
              ),

              if (i != evolutions.length - 1)
                Padding(
                  padding: EdgeInsets.only(
                    left: 8,
                    right: 8,
                    top: MediaQuery.of(context).size.width >= 640 ? bottomSheetMaxWidth * 0.23 : 60,
                    bottom: 0,
                  ),
                  child: AppIcon.others(OtherIcons.arrow, size: 7, color: AppColors.gray3),
                ),
              // SizedBox(width: 12),
            ],
          ],
        ),
      ),
    );
  }
}

class _EvolutionItem extends StatelessWidget {
  final EvolutionModel pokemon;
  final PokemonIcons icon;

  const _EvolutionItem({required this.pokemon, required this.icon});

  @override
  Widget build(BuildContext context) {
    final color = icon.cardColor;

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 1.5),
          ),
          child: Transform.flip(
            flipX: true,
            child: CachedNetworkImage(
              imageUrl: '$pokemonBaseUrlImage${pokemon.id}.png',
              fit: BoxFit.contain,
              placeholder: (context, _) => const Center(child: CircularProgressIndicator()),
            ),
          ),
        ),
        const SizedBox(height: 18),
        SizedBox(
          height: 40,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '${capitalize(pokemon.name)} ',
                  style: AppText.defaultStyle.copyWith(
                    color: AppColors.gray3,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Text(
                    '#${parseId(pokemon.id)}',
                    style: AppText.defaultStyle.copyWith(color: AppColors.gray3, fontSize: 10),
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),

        AppTag(type: icon),
      ],
    );
  }
}
