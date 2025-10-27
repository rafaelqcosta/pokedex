import 'package:dartz/dartz.dart';
import 'package:pokedex/core/cubit/failure.dart';
import 'package:pokedex/modules/home/domain/models/paginated_pokemons_model.dart';
import 'package:pokedex/modules/home/domain/repositories/pokemon_repository.dart';

abstract class GetPokemonsUsecase {
  Future<Either<Failure, PaginatedPokemons>> call(String? nextUrl);
}

class GetPokemonsUsecaseImpl implements GetPokemonsUsecase {
  final PokemonRepository repository;

  GetPokemonsUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, PaginatedPokemons>> call(nextUrl) {
    return repository.getPokemons(nextUrl);
  }
}
