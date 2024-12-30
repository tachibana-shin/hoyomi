import 'package:honyomi/core_services/interfaces/basic_image.dart';

class EpisodeEiga {
  final String name;
  final String episodeId;
  final BasicImage? image;
  final String? description;

  EpisodeEiga(
      {required this.name,
      required this.episodeId,
      this.image,
      this.description});

  factory EpisodeEiga.createFakeData() {
    return EpisodeEiga(
      name: "Episode 1",
      episodeId: "1",
    );
  }
}
