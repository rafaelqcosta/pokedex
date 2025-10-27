abstract class PokemonDatasource {
  Future<Map<String, dynamic>> getPokemons(String? nextUrl);
  Future<dynamic> getPokemonDetails(int id);
}
