import 'package:hoyomi/core_services/interfaces/o_image.dart';

class EigaEpisode {
  final String name;
  final String episodeId;
  final OImage? image;
  final String? description;

  EigaEpisode({
    required this.name,
    required this.episodeId,
    this.image,
    this.description,
  });

  /// Override equality operator to compare instances
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;

    return other is EigaEpisode &&
        other.name == name &&
        other.episodeId == episodeId &&
        other.image == image &&
        other.description == description;
  }

  /// Override hashCode to ensure consistency
  @override
  int get hashCode => Object.hash(name, episodeId, image, description);

  factory EigaEpisode.createFakeData() {
    return EigaEpisode(name: "Episode 1", episodeId: "1");
  }

  factory EigaEpisode.fromJson(Map<String, dynamic> json) {
    return EigaEpisode(
      name: json['name'] as String,
      episodeId: json['episodeId'] as String,
      image: json['image'] != null
          ? OImage.fromJson(json['image'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
    );
  }

  /// Converts the [EigaEpisode] instance into a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'episodeId': episodeId,
      'image': image?.toJson(),
      'description': description,
    };
  }
}
