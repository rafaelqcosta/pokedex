import 'package:dartz/dartz.dart';
import 'package:pokedex/core/cubit/failure.dart';
import 'package:pokedex/modules/home/data/datasources/evolution_datasource.dart';
import 'package:pokedex/modules/home/domain/models/evolution_model.dart';
import 'package:pokedex/modules/home/domain/repositories/evolution_repository.dart';

class EvolutionRepositoryImpl implements EvolutionRepository {
  final EvolutionDatasource datasource;

  EvolutionRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<EvolutionModel>>> getEvolutionChain(int id) async {
    try {
      final result = await datasource(id);
      final model = EvolutionChainModel.fromApi(result);
      return Right(model.evolutions);
    } catch (e) {
      return Left(JsonParsingFailure());
    }
  }
}
