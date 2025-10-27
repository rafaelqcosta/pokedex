import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/constants.dart';
import 'package:pokedex/core/design_system/imports.dart';
import 'package:pokedex/modules/home/domain/models/pokemon_model.dart';

class PokemonCard extends StatelessWidget {
  final int index;
  final PokemonModel pokemon;
  final bool isFavorite;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;

  const PokemonCard({
    super.key,
    required this.index,
    required this.pokemon,
    this.isFavorite = false,
    this.onTap,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color background = pokemon.elements.first.cardColor;

    return AppCard(
      onTap: onTap,
      backgroundColor: background,
      borderRadius: 32,
      padding: EdgeInsets.zero,
      height: 132,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 10, top: 16, bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Texto e tags (lado esquerdo)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText.regular('#${index.toString().padLeft(3, '0')}', size: 12),
                          const SizedBox(height: 4),
                          AppText.bold(pokemon.name, size: 28),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 8,
                            runSpacing: 4,
                            children: pokemon.elements.map((t) => AppTag(type: t)).toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(right: -16, top: -10, child: AppImage.png(PngImgs.pokeball)),
              Positioned(
                bottom: 0,
                right: MediaQuery.of(context).size.width * 0.15,
                child: CachedNetworkImage(
                  imageUrl: '$pokemonBaseUrlImage${pokemon.id}.png',
                  height: 124,
                  width: 124,
                  fit: BoxFit.contain,
                  errorWidget: (context, url, error) =>
                      const Center(child: CircularProgressIndicator()),
                ),
              ),
              Positioned(
                top: 20,
                right: 16,
                child: GestureDetector(
                  onTap: () {
                    AppSnackbarManager.show(
                      context: context,
                      icon: AppIcon.others(
                        !isFavorite ? OtherIcons.favorite_fill : OtherIcons.favorite,
                        size: 20,
                      ),
                      message: !isFavorite
                          ? 'Pokémon adicionado aos favoritos'
                          : 'Pokémon removido dos favoritos',
                      borderColor: AppColors.yellow,
                    );
                    if (onFavoriteTap != null) {
                      onFavoriteTap!();
                    }
                  },
                  child: AppIcon.others(
                    isFavorite ? OtherIcons.favorite_fill : OtherIcons.favorite,
                    size: 40,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
