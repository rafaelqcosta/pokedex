import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app_routes.dart';
import 'package:pokedex/core/services/http/dio_http_service.dart';
import 'package:pokedex/core/services/preferences/preferences_service.dart';
import 'package:pokedex/modules/dashboard/dashboard_page.dart';
import 'package:pokedex/modules/home/data/datasources/evolution_datasource.dart';
import 'package:pokedex/modules/home/data/datasources/favorite_pokemon_datasource.dart';
import 'package:pokedex/modules/home/data/datasources/pokemon_datasource.dart';
import 'package:pokedex/modules/home/data/repositories/evolution_repository_impl.dart';
import 'package:pokedex/modules/home/data/repositories/favorite_pokemon_repository_impl.dart';
import 'package:pokedex/modules/home/data/repositories/pokemon_repository_impl.dart';
import 'package:pokedex/modules/home/domain/repositories/evolution_repository.dart';
import 'package:pokedex/modules/home/domain/repositories/favorite_pokemon_repository.dart';
import 'package:pokedex/modules/home/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/modules/home/domain/usecases/get_evolution_usecase.dart';
import 'package:pokedex/modules/home/domain/usecases/get_favorite_pokemons_usecase.dart';
import 'package:pokedex/modules/home/domain/usecases/get_pokemons_usecase.dart';
import 'package:pokedex/modules/home/domain/usecases/save_favorite_pokemons_usecase.dart';
import 'package:pokedex/modules/home/external/evolution_datasource_impl.dart';
import 'package:pokedex/modules/home/external/favorite_pokemon_datasource_impl.dart';
import 'package:pokedex/modules/home/external/pokemon_datasource_impl.dart';
import 'package:pokedex/modules/home/presentation/bloc/favorite_pokemons_bloc.dart';
import 'package:pokedex/modules/home/presentation/bloc/get_evolution_bloc.dart';
import 'package:pokedex/modules/home/presentation/bloc/get_pokemons_bloc.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<DioHttpService>(DioHttpService.new);
    i.addSingleton(SharedPrefsStorageService.new);

    i.add<FavoritePokemonDatasource>(FavoritePokemonDatasourceImpl.new);
    i.add<FavoritePokemonRepository>(FavoritePokemonRepositoryImpl.new);
    i.add<GetFavoritePokemonsUsecase>(GetFavoritePokemonsUsecaseImpl.new);
    i.add<SaveFavoritePokemonsUsecase>(SaveFavoritePokemonsUsecaseImpl.new);
    i.addLazySingleton(FavoritePokemonsBloc.new);

    i.add<PokemonDatasource>(PokemonDatasourceImpl.new);
    i.add<PokemonRepository>(PokemonRepositoryImpl.new);
    i.add<GetPokemonsUsecase>(GetPokemonsUsecaseImpl.new);
    i.addLazySingleton(GetPokemonsBloc.new);

    i.add<EvolutionDatasource>(EvolutionDatasourceImpl.new);
    i.add<EvolutionRepository>(EvolutionRepositoryImpl.new);
    i.add<GetEvolutionUsecase>(GetEvolutionUsecaseImpl.new);
    i.addLazySingleton(GetEvolutionBloc.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(AppRoutes.splash, child: (context) => const MainPage());
  }
}
