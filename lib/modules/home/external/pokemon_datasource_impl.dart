import 'package:pokedex/core/cubit/failure.dart';
import 'package:pokedex/core/services/http/dio_http_service.dart';
import 'package:pokedex/modules/home/data/datasources/pokemon_datasource.dart';

class PokemonDatasourceImpl implements PokemonDatasource {
  final DioHttpService dio;

  PokemonDatasourceImpl(this.dio);
  @override
  Future<Map<String, dynamic>> getPokemons(String? nextUrl) async {
    try {
      final endpoint = nextUrl ?? 'pokemon?limit=20';
      final result = await dio.get(endpoint);
      final data = result.data;

      if (data == null || data['results'] == null) {
        throw Failure('Resposta inválida da API');
      }

      return {'results': data['results'] as List, 'next': data['next']};
    } on Failure {
      rethrow;
    } catch (e) {
      throw Failure('Erro inesperado ao buscar Pokémons: $e');
    }
  }

  @override
  Future<dynamic> getPokemonDetails(int id) async {
    try {
      final detailResponse = await dio.get('https://pokeapi.co/api/v2/pokemon/$id');

      return detailResponse.data;
    } on Failure {
      rethrow;
    } catch (e) {
      throw Failure('Erro inesperado ao buscar Pokémons: $e');
    }
  }
}
