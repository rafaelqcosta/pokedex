import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/app_widget.dart';
import 'package:pokedex/core/constants/constants.dart';
import 'package:pokedex/core/design_system/imports.dart';
import 'package:pokedex/modules/home/domain/models/evolution_model.dart';

class PokemonEvolutionRow extends StatelessWidget {
  final List<EvolutionModel> evolutions;
  final PokemonIcons icon;

  const PokemonEvolutionRow({super.key, required this.evolutions, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width >= 640
          ? bottomSheetMaxWidth
          : MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (int i = 0; i < evolutions.length; i++) ...[
              _EvolutionItem(pokemon: evolutions[i], icon: icon),

              // if (i != evolutions.length - 1)
              //   const Padding(
              //     padding: EdgeInsets.only(left: 8, right: 8, top: 80, bottom: 0),
              //     child: Icon(Icons.arrow_forward, size: 20, color: Colors.grey),
              //   ),
              SizedBox(width: 12),
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
          width: 100,
          height: 100,
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

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText.medium(pokemon.name, size: 16, color: AppColors.gray3),
            const SizedBox(width: 4),
            AppText.regular(
              '#${pokemon.id.toString().padLeft(3, '0')}',
              size: 10,
              color: AppColors.gray3,
            ),
          ],
        ),

        const SizedBox(height: 12),

        AppTag(type: icon),
      ],
    );
  }
}
