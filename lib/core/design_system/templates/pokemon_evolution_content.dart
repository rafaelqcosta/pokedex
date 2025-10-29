import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/app_widget.dart';
import 'package:pokedex/core/constants/constants.dart';
import 'package:pokedex/core/design_system/imports.dart';
import 'package:pokedex/core/utils/parse_utils.dart';
import 'package:pokedex/modules/home/domain/models/evolution_model.dart';
import 'package:pokedex/modules/home/domain/models/pokemon_model.dart';

class PokemonDetailContent extends StatefulWidget {
  final PokemonModel pokemon;
  final bool isFavorite;
  final Function() onFavoriteTap;
  final List<EvolutionModel> evolutions;

  const PokemonDetailContent({
    super.key,
    required this.pokemon,
    required this.evolutions,
    required this.isFavorite,
    required this.onFavoriteTap,
  });

  @override
  State<PokemonDetailContent> createState() => _PokemonDetailContentState();
}

class _PokemonDetailContentState extends State<PokemonDetailContent> {
  bool isFavorite = false;

  @override
  void initState() {
    isFavorite = widget.isFavorite;
    super.initState();
  }

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
                  width: bottomSheetMaxWidth,
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
                PokemonEvolutionRow(
                  evolutions: widget.evolutions,
                  icon: widget.pokemon.elements.first,
                ),
              ],
            ),
          ),
        ),

        Positioned(
          top: 38,
          left: 30,
          child: Container(
            constraints: BoxConstraints(maxWidth: bottomSheetMaxWidth),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Transform.flip(
                  flipX: true,
                  child: CachedNetworkImage(
                    imageUrl: '$pokemonBaseUrlImage${widget.pokemon.id}.png',
                    height: 200,
                    width: 200,
                    fit: BoxFit.contain,
                    placeholder: (context, _) => const Center(child: CircularProgressIndicator()),
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.semiBold(
                      ' ${parseId(widget.pokemon.id)}',
                      size: 14,
                      color: AppColors.white,
                    ),
                    SizedBox(height: 4),
                    AppText.bold(widget.pokemon.name, size: 24, color: AppColors.white),
                    SizedBox(height: 8),
                    AppTag(type: widget.pokemon.elements.first),
                  ],
                ),
              ],
            ),
          ),
        ),

        Positioned(
          top: 30,
          right: 20,
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
              widget.onFavoriteTap();
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            child: AppIcon.others(
              isFavorite ? OtherIcons.favorite_fill : OtherIcons.favorite,
              size: 40,
            ),
          ),
        ),
      ],
    );
  }
}
