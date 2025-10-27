import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/cubit/base_state.dart';
import 'package:pokedex/modules/home/domain/models/pokemon_model.dart';
import 'package:pokedex/modules/home/domain/usecases/get_favorite_pokemons_usecase.dart';
import 'package:pokedex/modules/home/domain/usecases/save_favorite_pokemons_usecase.dart';

class FavoritePokemonsBloc extends Cubit<BaseState<List<PokemonModel>>> {
  final GetFavoritePokemonsUsecase getUsecase;
  final SaveFavoritePokemonsUsecase saveUsecase;
  FavoritePokemonsBloc(this.getUsecase, this.saveUsecase) : super(const BaseState.initial());

  Future<void> getAll() async {
    emit(const BaseState.loading());

    final result = await getUsecase();

    result.fold(
      (failure) => emit(BaseState.failure(failure)),
      (success) => emit(BaseState.success(success)),
    );
  }

  Future<void> update(PokemonModel pokemons) async {
    final pokemonsList = List<PokemonModel>.from(state.data ?? []);
    if (pokemonsList.contains(pokemons)) {
      pokemonsList.remove(pokemons);
    } else {
      pokemonsList.add(pokemons);
    }
    final result = await saveUsecase(pokemonsList);

    result.fold(
      (failure) => emit(BaseState.failure(failure)),
      (success) => emit(BaseState.success(pokemonsList)),
    );
  }
}
