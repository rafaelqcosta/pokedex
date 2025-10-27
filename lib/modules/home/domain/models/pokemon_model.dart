import 'package:pokedex/core/design_system/tokens/icons/pokemon_icons.dart';

class PokemonModel {
  final int id;
  final String name;
  final List<PokemonIcons> elements;

  const PokemonModel({required this.id, required this.name, required this.elements});

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'types': elements.map((e) => e.name).toList(),
  };

  factory PokemonModel.fromApi(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'],
      name: json['name'],
      elements:
          (json['types'] as List<dynamic>?)
              ?.map((e) => PokemonIcons.values.byName(e['type']['name']))
              .toList() ??
          [],
    );
  }
  factory PokemonModel.fromStorage(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'],
      name: json['name'],
      elements:
          (json['types'] as List<dynamic>?)?.map((e) => PokemonIcons.values.byName(e)).toList() ??
          [],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PokemonModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
