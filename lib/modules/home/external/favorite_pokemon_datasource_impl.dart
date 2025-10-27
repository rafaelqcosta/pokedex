import 'dart:convert';

import 'package:pokedex/core/services/preferences/preferences_service.dart';
import 'package:pokedex/modules/home/data/datasources/favorite_pokemon_datasource.dart';

class FavoritePokemonDatasourceImpl implements FavoritePokemonDatasource {
  final SharedPrefsStorageService prefs;
  static const String key = 'favorite_pokemons';

  FavoritePokemonDatasourceImpl(this.prefs);

  @override
  Future<List<Map<String, dynamic>>> getPokemons() async {
    final jsonString = await prefs.read<String>(key);
    if (jsonString == null) return [];
    final decoded = jsonDecode(jsonString) as List;
    return decoded.cast<Map<String, dynamic>>();
  }

  @override
  Future<void> savePokemons(List<Map<String, dynamic>> pokemons) async {
    final jsonString = jsonEncode(pokemons);
    await prefs.save(key, jsonString);
  }
}
