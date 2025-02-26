import 'package:hoyomi/core_services/interfaces/o_image.dart';

class Genre {
  final String name;
  final String genreId;
  final String? description;
  final OImage? image;

  const Genre({
    required this.name,
    required this.genreId,
    this.description,
    this.image,
  });

  factory Genre.createFakeData() {
    return Genre(
      name: "Action",
      genreId: "1",
      description: "Action-packed genre with intense battles.",
      image: OImage.createFakeData(),
    );
  }

  // Convert from JSON
  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
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
