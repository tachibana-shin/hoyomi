import 'package:honyomi/core_services/interfaces/basic_image.dart';

class EpisodeEiga {
  final String name;
  final String episodeId;
  final BasicImage? image;

  EpisodeEiga({required this.name, required this.episodeId, this.image});
}