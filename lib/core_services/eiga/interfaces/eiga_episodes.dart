import 'package:hoyomi/core_services/eiga/interfaces/eiga_episode.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';

class EigaEpisodes {
  final List<EigaEpisode> episodes;
  final OImage? image;
  final OImage? poster;
  final TimeAndDay? schedule;

  EigaEpisodes({
    required this.episodes,
    this.image,
    this.poster,
    this.schedule,
  });

  factory EigaEpisodes.createFakeData() {
    return EigaEpisodes(
      episodes: List.generate(12, (index) => EigaEpisode.createFakeData()),
    );
  }
}

class TimeAndDay {
  final int day;
  final int hour;
  final int minute;

  TimeAndDay({required this.day, required this.hour, required this.minute});
}
