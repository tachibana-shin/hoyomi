import 'package:hoyomi/core_services/interfaces/o_image.dart';

class EigaEpisode {
  final String name;
  final String episodeId;
  final OImage? image;
  final String? description;

  EigaEpisode(
      {required this.name,
      required this.episodeId,
      this.image,
      this.description});

  factory EigaEpisode.createFakeData() {
    return EigaEpisode(
      name: "Episode 1",
      episodeId: "1",
    );
  }
}
