import 'package:dartz/dartz.dart';
import 'package:pokedex/core/cubit/failure.dart';
import 'package:pokedex/modules/home/domain/models/pokemon_model.dart';
import 'package:pokedex/modules/home/domain/repositories/favorite_pokemon_repository.dart';

abstract class GetFavoritePokemonsUsecase {
  Future<Either<Failure, List<PokemonModel>>> call();
}

class GetFavoritePokemonsUsecaseImpl implements GetFavoritePokemonsUsecase {
  final FavoritePokemonRepository repository;

  GetFavoritePokemonsUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, List<PokemonModel>>> call() {
    return repository.getPokemons();
  }
}
