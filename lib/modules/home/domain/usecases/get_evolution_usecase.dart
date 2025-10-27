import 'package:dartz/dartz.dart';
import 'package:pokedex/core/cubit/failure.dart';
import 'package:pokedex/modules/home/domain/models/evolution_model.dart';
import 'package:pokedex/modules/home/domain/repositories/evolution_repository.dart';

abstract class GetEvolutionUsecase {
  Future<Either<Failure, List<EvolutionModel>>> call(int id);
}

class GetEvolutionUsecaseImpl implements GetEvolutionUsecase {
  final EvolutionRepository repository;

  GetEvolutionUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, List<EvolutionModel>>> call(int id) {
    return repository.getEvolutionChain(id);
  }
}
