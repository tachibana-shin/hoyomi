import 'package:honyomi/core_services/eiga/interfaces/episode_eiga.dart';
import 'package:honyomi/core_services/interfaces/basic_image.dart';

class EpisodesEiga {
  final List<EpisodeEiga> episodes;
  final BasicImage? image;
  final BasicImage? poster;
  final TimeOfDay? schedule;

  EpisodesEiga({
    required this.episodes,
    this.image,
    this.poster,
    this.schedule,
  });
}

class TimeOfDay {
  final String day;
  final int hour;
  final int minute;

  TimeOfDay({required this.day, required this.hour, required this.minute});
}
