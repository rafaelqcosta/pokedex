import 'package:dartz/dartz.dart';
import 'package:pokedex/core/cubit/failure.dart';
import 'package:pokedex/modules/home/domain/models/pokemon_model.dart';

abstract class FavoritePokemonRepository {
  Future<Either<Failure, List<PokemonModel>>> getPokemons();
  Future<Either<Failure, Unit>> savePokemons(List<PokemonModel> pokemons);
}
