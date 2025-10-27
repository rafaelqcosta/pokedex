import 'package:dartz/dartz.dart';
import 'package:pokedex/core/cubit/failure.dart';
import 'package:pokedex/modules/home/data/datasources/pokemon_datasource.dart';
import 'package:pokedex/modules/home/domain/models/paginated_pokemons_model.dart';
import 'package:pokedex/modules/home/domain/models/pokemon_model.dart';
import 'package:pokedex/modules/home/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDatasource datasource;

  PokemonRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, PaginatedPokemons>> getPokemons(String? nextUrl) async {
    try {
      final response = await datasource.getPokemons(nextUrl);
      final results = response['results'] as List;
      final next = response['next'] as String?;

      // Obter IDs de cada Pokémon
      final pokemons = <PokemonModel>[];

      for (final json in results) {
        final uri = Uri.parse(json['url']);
        final id = int.tryParse(uri.pathSegments[uri.pathSegments.length - 2]) ?? 0;

        // Buscar detalhes de cada Pokémon
        try {
          final detail = await datasource.getPokemonDetails(id);
          pokemons.add(PokemonModel.fromApi(detail));
        } catch (e) {
          print('Erro ao buscar detalhes do Pokémon $id: $e');
        }
      }

      return Right(PaginatedPokemons(pokemons: pokemons, nextUrl: next));
    } catch (e) {
      return Left(JsonParsingFailure());
    }
  }
}
