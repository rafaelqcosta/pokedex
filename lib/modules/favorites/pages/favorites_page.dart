import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app_widget.dart';
import 'package:pokedex/core/cubit/base_state.dart';
import 'package:pokedex/core/design_system/imports.dart';
import 'package:pokedex/modules/home/domain/models/pokemon_model.dart';
import 'package:pokedex/modules/home/presentation/bloc/favorite_pokemons_bloc.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final favoritePokemonsBloc = Modular.get<FavoritePokemonsBloc>();

  @override
  void initState() {
    favoritePokemonsBloc.getAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppHeaderTitle(title: 'Meus Pokémons favoritos'),

        Expanded(
          child: BlocBuilder<FavoritePokemonsBloc, BaseState<List<PokemonModel>>>(
            bloc: favoritePokemonsBloc,

            builder: (context, state) {
              final pokemons = state.data ?? [];
              if (state.isError) {
                return Center(child: AppText.regular(state.failure?.message ?? ''));
              }

              if (pokemons.isEmpty) {
                return Center(child: AppText.regular('Sem pokémons favoritos'));
              }

              return ValueListenableBuilder(
                valueListenable: isMobile,
                builder: (context, isMobile, child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 19),
                    child: isMobile
                        ? ListView.separated(
                            itemCount: pokemons.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final pokemon = pokemons[index];
                              return PokemonCard(
                                onFavoriteTap: () {
                                  favoritePokemonsBloc.update(pokemon);
                                },
                                index: index,
                                pokemon: pokemon,
                                isFavorite: true,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(height: 8);
                            },
                          )
                        : GridView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 24),
                            itemCount: pokemons.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: (MediaQuery.of(context).size.width / 420)
                                  .floor()
                                  .clamp(1, 6),
                              crossAxisSpacing: 24,
                              mainAxisSpacing: 24,
                              mainAxisExtent: 138,
                            ),
                            itemBuilder: (context, index) {
                              final pokemon = pokemons[index];
                              return Center(
                                child: SizedBox(
                                  width: 382,
                                  height: 138,
                                  child: PokemonCard(
                                    onFavoriteTap: () {
                                      favoritePokemonsBloc.update(pokemon);
                                    },
                                    index: index,
                                    pokemon: pokemon,
                                    isFavorite: true,
                                  ),
                                ),
                              );
                            },
                          ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
