import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
    return HeaderMobile(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38),
            child: AppText.semiBold('Meus Pokémons favoritos', size: 32),
          ),
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

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 19),
                  child: ListView.separated(
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
                    itemCount: pokemons.length,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
