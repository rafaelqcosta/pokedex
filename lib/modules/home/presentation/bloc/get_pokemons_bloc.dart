import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/cubit/base_state.dart';
import 'package:pokedex/modules/home/domain/models/paginated_pokemons_model.dart';
import 'package:pokedex/modules/home/domain/usecases/get_pokemons_usecase.dart';

class GetPokemonsBloc extends Cubit<BaseState<PaginatedPokemons>> {
  final GetPokemonsUsecase usecase;

  GetPokemonsBloc(this.usecase) : super(const BaseState.initial());

  Future<void> call({bool loadMore = false}) async {
    final current = state.data ?? PaginatedPokemons.empty;

    if (state.isLoading || (!current.hasNextPage && loadMore)) return;
    if (!loadMore) {
      emit(BaseState.loading());
    }

    final result = await usecase(loadMore ? current.nextUrl : null);

    result.fold((failure) => emit(BaseState.failure(failure)), (success) {
      final merged = loadMore
          ? current.copyWith(
              pokemons: [...current.pokemons, ...success.pokemons],
              nextUrl: success.nextUrl,
            )
          : success;

      emit(BaseState.success(merged));
    });
  }
}
