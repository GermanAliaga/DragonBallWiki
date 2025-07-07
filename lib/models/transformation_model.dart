class Transformation {
  final int id;
  final String name;
  final String ki;
  final String image;

  Transformation({
    required this.id,
    required this.name,
    required this.ki,
    required this.image,
  });

  factory Transformation.fromJson(Map<String, dynamic> json) {
    return Transformation(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      ki: json['ki'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
