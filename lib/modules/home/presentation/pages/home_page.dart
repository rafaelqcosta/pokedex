import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app_widget.dart';
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
    return Column(
      children: [
        AppHeaderTitle(title: 'Qual Pokémon você está procurando?'),

        Expanded(
          child: BlocBuilder<GetPokemonsBloc, BaseState<PaginatedPokemons>>(
            bloc: getPokemonsBloc,
            builder: (context, state) {
              if (state.isError) {
                return AppErrorMessage(
                  message: state.failure?.message ?? 'Ops... erro desconhecido',
                  errorType: AppErrorType.failure,
                  onRetry: fetch,
                );
              } else if (state.isLoading) {
                return const AppLoading();
              }
              final pokemons = state.data?.pokemons ?? [];
              if (pokemons.isEmpty) {
                return AppErrorMessage(message: 'Nenhum Pokémon encontrado', onRetry: fetch);
              }

              return ValueListenableBuilder(
                valueListenable: isMobile,
                builder: (context, isMobile, child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 19),
                    child: isMobile
                        ? ListView.separated(
                            controller: scrollController,
                            itemCount: pokemons.length + 1,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              if (index == pokemons.length) {
                                if (state.data?.hasNextPage ?? false) {
                                  return const AppLoading();
                                }
                                return const SizedBox.shrink();
                              }
                              final pokemon = pokemons[index];
                              return BlocBuilder<
                                FavoritePokemonsBloc,
                                BaseState<List<PokemonModel>>
                              >(
                                bloc: favoritePokemonsBloc,
                                builder: (context, state) {
                                  return _buildPokemonCard(pokemon, index, state, context);
                                },
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(height: 8);
                            },
                          )
                        : GridView.builder(
                            controller: scrollController,
                            physics: const AlwaysScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 24),
                            itemCount: pokemons.length + 1,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: (MediaQuery.of(context).size.width / 420)
                                  .floor()
                                  .clamp(1, 6),
                              crossAxisSpacing: 24,
                              mainAxisSpacing: 24,
                              mainAxisExtent: 138,
                            ),
                            itemBuilder: (context, index) {
                              if (index == pokemons.length) {
                                if (state.data?.hasNextPage ?? false) {
                                  return const AppLoading();
                                }
                                return const SizedBox.shrink();
                              }

                              final pokemon = pokemons[index];
                              return BlocBuilder<
                                FavoritePokemonsBloc,
                                BaseState<List<PokemonModel>>
                              >(
                                bloc: favoritePokemonsBloc,
                                builder: (context, favState) {
                                  return Center(
                                    child: SizedBox(
                                      width: 382,
                                      height: 138,
                                      child: _buildPokemonCard(pokemon, index, favState, context),
                                    ),
                                  );
                                },
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

  PokemonCard _buildPokemonCard(
    PokemonModel pokemon,
    int index,
    BaseState<List<PokemonModel>> favState,
    BuildContext context,
  ) {
    return PokemonCard(
      onFavoriteTap: () => favoritePokemonsBloc.update(pokemon),
      index: index,
      pokemon: pokemon,
      isFavorite: favState.data?.any((p) => p.id == pokemon.id) ?? false,
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
  }
}
