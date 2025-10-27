import 'package:dartz/dartz.dart';
import 'package:pokedex/core/cubit/failure.dart';
import 'package:pokedex/modules/home/domain/models/paginated_pokemons_model.dart';

abstract class PokemonRepository {
  Future<Either<Failure, PaginatedPokemons>> getPokemons(String? nextUrl);
}
