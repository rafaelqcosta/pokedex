import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/cubit/base_state.dart';
import 'package:pokedex/modules/home/domain/models/evolution_model.dart';
import 'package:pokedex/modules/home/domain/usecases/get_evolution_usecase.dart';

class GetEvolutionBloc extends Cubit<BaseState<List<EvolutionModel>>> {
  final GetEvolutionUsecase usecase;

  GetEvolutionBloc(this.usecase) : super(const BaseState.initial());

  Future<void> load(int pokemonId) async {
    emit(const BaseState.loading());
    final result = await usecase(pokemonId);

    result.fold(
      (failure) => emit(BaseState.failure(failure)),
      (success) => emit(BaseState.success(success)),
    );
  }
}
