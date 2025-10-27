import 'package:pokedex/modules/home/domain/models/pokemon_model.dart';

class PaginatedPokemons {
  final List<PokemonModel> pokemons;
  final String? nextUrl;

  const PaginatedPokemons({required this.pokemons, this.nextUrl});

  bool get hasNextPage => nextUrl != null && nextUrl!.isNotEmpty;

  PaginatedPokemons copyWith({List<PokemonModel>? pokemons, String? nextUrl}) {
    return PaginatedPokemons(pokemons: pokemons ?? this.pokemons, nextUrl: nextUrl ?? this.nextUrl);
  }

  static const empty = PaginatedPokemons(pokemons: []);
}
