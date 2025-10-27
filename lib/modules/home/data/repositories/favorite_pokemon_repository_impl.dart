import 'package:dartz/dartz.dart';
import 'package:pokedex/core/cubit/failure.dart';
import 'package:pokedex/modules/home/data/datasources/favorite_pokemon_datasource.dart';
import 'package:pokedex/modules/home/domain/models/pokemon_model.dart';
import 'package:pokedex/modules/home/domain/repositories/favorite_pokemon_repository.dart';

class FavoritePokemonRepositoryImpl implements FavoritePokemonRepository {
  final FavoritePokemonDatasource datasource;

  FavoritePokemonRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<PokemonModel>>> getPokemons() async {
    try {
      final result = await datasource.getPokemons();
      final pokemons = result.map(PokemonModel.fromStorage).toList();
      return Right(pokemons);
    } catch (e) {
      return Left(JsonParsingFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> savePokemons(List<PokemonModel> pokemons) async {
    try {
      final jsonList = pokemons.map((e) => e.toJson()).toList();
      await datasource.savePokemons(jsonList);
      return const Right(unit);
    } catch (e) {
      return Left(JsonParsingFailure());
    }
  }
}
