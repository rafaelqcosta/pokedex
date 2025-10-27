abstract class FavoritePokemonDatasource {
  Future<List<Map<String, dynamic>>> getPokemons();
  Future<void> savePokemons(List<Map<String, dynamic>> pokemons);
}
