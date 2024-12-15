class BasicGenre {
  final String name;
  final String genreId;
  final String? description;
  final String? image;

  const BasicGenre(
      {required this.name,
      required this.genreId,
      this.description,
      this.image});

  // Convert from JSON
  factory BasicGenre.fromJson(Map<String, dynamic> json) {
    return BasicGenre(
      name: json['name'],
      genreId: json['genreId'],
      description: json['description'],
      image: json['image'],
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'genreId': genreId,
      'description': description,
      'image': image,
    };
  }
}
