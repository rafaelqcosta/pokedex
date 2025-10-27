class EvolutionModel {
  final int id;
  final String name;

  const EvolutionModel({required this.id, required this.name});
}

class EvolutionChainModel {
  final List<EvolutionModel> evolutions;

  EvolutionChainModel({required this.evolutions});

  factory EvolutionChainModel.fromApi(Map<String, dynamic> json) {
    final chain = json['chain'];
    final evolutions = <EvolutionModel>[];

    void extractEvolutions(Map<String, dynamic> node) {
      final species = node['species'];
      final uri = Uri.parse(species['url']);
      final id = int.parse(uri.pathSegments[uri.pathSegments.length - 2]);

      evolutions.add(EvolutionModel(id: id, name: species['name']));

      for (final e in node['evolves_to']) {
        extractEvolutions(e);
      }
    }

    extractEvolutions(chain);
    return EvolutionChainModel(evolutions: evolutions);
  }
}
