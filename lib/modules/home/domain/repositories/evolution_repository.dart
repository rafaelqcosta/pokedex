import 'package:dartz/dartz.dart';
import 'package:pokedex/core/cubit/failure.dart';
import 'package:pokedex/modules/home/domain/models/evolution_model.dart';

abstract class EvolutionRepository {
  Future<Either<Failure, List<EvolutionModel>>> getEvolutionChain(int pokemonId);
}
