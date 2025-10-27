import 'package:pokedex/core/cubit/failure.dart';
import 'package:pokedex/core/services/http/dio_http_service.dart';
import 'package:pokedex/modules/home/data/datasources/evolution_datasource.dart';

class EvolutionDatasourceImpl implements EvolutionDatasource {
  final DioHttpService dio;

  EvolutionDatasourceImpl(this.dio);

  @override
  Future<Map<String, dynamic>> call(int id) async {
    try {
      final speciesResponse = await dio.get('pokemon-species/$id');
      final evolutionUrl = speciesResponse.data['evolution_chain']['url'];

      final evolutionResponse = await dio.getUri(Uri.parse(evolutionUrl));
      return evolutionResponse.data;
    } on Failure {
      rethrow;
    } catch (e) {
      throw Failure('Erro inesperado ao buscar evolução dos Pokémons: $e');
    }
  }
}
