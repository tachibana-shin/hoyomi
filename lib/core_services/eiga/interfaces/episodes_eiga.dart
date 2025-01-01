import 'package:honyomi/core_services/eiga/interfaces/episode_eiga.dart';
import 'package:honyomi/core_services/interfaces/basic_image.dart';

class EpisodesEiga {
  final List<EpisodeEiga> episodes;
  final BasicImage? image;
  final BasicImage? poster;
  final TimeAndDay? schedule;

  EpisodesEiga({
    required this.episodes,
    this.image,
    this.poster,
    this.schedule,
  });

  factory EpisodesEiga.createFakeData() {
    return EpisodesEiga(
      episodes: List.generate(12, (index) => EpisodeEiga.createFakeData()),
    );
  }
}

class TimeAndDay {
  final int day;
  final int hour;
  final int minute;

  TimeAndDay({required this.day, required this.hour, required this.minute});
}
