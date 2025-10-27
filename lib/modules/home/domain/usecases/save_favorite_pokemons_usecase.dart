import 'package:dartz/dartz.dart';
import 'package:pokedex/core/cubit/failure.dart';
import 'package:pokedex/modules/home/domain/models/pokemon_model.dart';
import 'package:pokedex/modules/home/domain/repositories/favorite_pokemon_repository.dart';

abstract class SaveFavoritePokemonsUsecase {
  Future<Either<Failure, Unit>> call(List<PokemonModel> pokemons);
}

class SaveFavoritePokemonsUsecaseImpl implements SaveFavoritePokemonsUsecase {
  final FavoritePokemonRepository repository;

  SaveFavoritePokemonsUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, Unit>> call(List<PokemonModel> pokemons) {
    return repository.savePokemons(pokemons);
  }
}
