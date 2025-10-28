import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/app_widget.dart';
import 'package:pokedex/core/constants/constants.dart';
import 'package:pokedex/core/design_system/imports.dart';
import 'package:pokedex/modules/home/domain/models/evolution_model.dart';
import 'package:pokedex/modules/home/domain/models/pokemon_model.dart';

class PokemonDetailContent extends StatelessWidget {
  final PokemonModel pokemon;
  final List<EvolutionModel> evolutions;

  const PokemonDetailContent({super.key, required this.pokemon, required this.evolutions});

  @override
  Widget build(BuildContext context) {
    return
    // Header com gradiente e imagem
    Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28),
            ),
          ),
        ),
        Positioned(
          top: 200,
          left: 0,
          bottom: 0,
          child: // Seção de Evolução
          Container(
            color: AppColors.gray8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: isMobile.value ? MediaQuery.of(context).size.width : bottomSheetWidth,
                  color: AppColors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 45, width: MediaQuery.of(context).size.width),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: AppText.bold('Evoluções', size: 14, color: AppColors.red),
                      ),
                      SizedBox(height: 27),
                    ],
                  ),
                ),
                PokemonEvolutionRow(evolutions: evolutions, icon: pokemon.elements.first),
              ],
            ),
          ),
        ),

        Positioned(
          top: 38,
          left: 30,
          child: Transform.flip(
            flipX: true,
            child: CachedNetworkImage(
              imageUrl: '$pokemonBaseUrlImage${pokemon.id}.png',
              height: 200,
              width: 200,
              fit: BoxFit.contain,
              placeholder: (context, _) => const Center(child: CircularProgressIndicator()),
            ),
          ),
        ),
      ],
    );
  }
}
