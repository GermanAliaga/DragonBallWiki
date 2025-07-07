import 'planet_model.dart';
import 'transformation_model.dart';

class Character {
  final int id;
  final String name;
  final String ki;
  final String maxKi;
  final String race;
  final String gender;
  final String description;
  final String image;
  final String affiliation;
  final Planet originPlanet;
  final List<Transformation> transformations;

  Character({
    required this.id,
    required this.name,
    required this.ki,
    required this.maxKi,
    required this.race,
    required this.gender,
    required this.description,
    required this.image,
    required this.affiliation,
    required this.originPlanet,
    required this.transformations,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      ki: json['ki'] ?? '',
      maxKi: json['maxKi'] ?? '',
      race: json['race'] ?? '',
      gender: json['gender'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      affiliation: json['affiliation'] ?? '',
      originPlanet: json['originPlanet'] != null
          ? Planet.fromJson(json['originPlanet'])
          : Planet(
              id: 0,
              name: 'Desconocido',
              description: '',
              image: '',
              isDestroyed: false,
            ),
      transformations: (json['transformations'] != null)
          ? (json['transformations'] as List)
              .map((e) => Transformation.fromJson(e))
              .toList()
          : [],
    );
}

}
