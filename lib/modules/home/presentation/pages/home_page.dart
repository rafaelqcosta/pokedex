import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/core/cubit/base_state.dart';
import 'package:pokedex/core/design_system/imports.dart';
import 'package:pokedex/modules/home/domain/models/paginated_pokemons_model.dart';
import 'package:pokedex/modules/home/domain/models/pokemon_model.dart';
import 'package:pokedex/modules/home/presentation/bloc/favorite_pokemons_bloc.dart';
import 'package:pokedex/modules/home/presentation/bloc/get_evolution_bloc.dart';
import 'package:pokedex/modules/home/presentation/bloc/get_pokemons_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final getPokemonsBloc = Modular.get<GetPokemonsBloc>();
  final favoritePokemonsBloc = Modular.get<FavoritePokemonsBloc>();
  final getEvolutionBloc = Modular.get<GetEvolutionBloc>();
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetch();

    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 300 &&
          !getPokemonsBloc.state.isLoading &&
          (getPokemonsBloc.state.data?.hasNextPage ?? false)) {
        getPokemonsBloc.call(loadMore: true);
      }
    });
  }

  void fetch() async {
    await favoritePokemonsBloc.getAll();
    getPokemonsBloc();
  }

  @override
  Widget build(BuildContext context) {
    return HeaderMobile(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38),
            child: AppText.semiBold('Qual Pokémon você está procurando?', size: 32),
          ),
          Expanded(
            child: BlocBuilder<GetPokemonsBloc, BaseState<PaginatedPokemons>>(
              bloc: getPokemonsBloc,
              builder: (context, state) {
                if (state.isError) {
                  return Center(child: AppText.regular(state.failure?.message ?? ''));
                } else if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                final pokemons = state.data?.pokemons ?? [];
                if (pokemons.isEmpty) {
                  return Center(child: AppText.regular('Sem pokémons'));
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 19),
                  child: ListView.separated(
                    controller: scrollController,
                    itemCount: pokemons.length + 1,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if (index == pokemons.length) {
                        if (state.data?.hasNextPage ?? false) {
                          return const Center(
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      }
                      final pokemon = pokemons[index];
                      return BlocBuilder<FavoritePokemonsBloc, BaseState<List<PokemonModel>>>(
                        bloc: favoritePokemonsBloc,
                        builder: (context, state) {
                          return PokemonCard(
                            onFavoriteTap: () {
                              favoritePokemonsBloc.update(pokemon);
                            },
                            index: index,
                            pokemon: pokemon,
                            isFavorite:
                                state.data != null && state.data!.any((p) => p.id == pokemon.id),
                            onTap: () async {
                              await getEvolutionBloc.load(pokemon.id);
                              PokemonBottomSheet.show(
                                context,
                                showHandle: false,
                                backgroundColor: pokemon.elements.first.cardColor,

                                child: PokemonDetailContent(
                                  pokemon: pokemon,
                                  evolutions: getEvolutionBloc.state.data ?? [],
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 8);
                    },
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
