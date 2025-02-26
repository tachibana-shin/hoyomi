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

  factory EigaEpisodes.fromJson(Map<String, dynamic> json) {
    return EigaEpisodes(
      episodes:
          (json['episodes'] as List)
              .map((e) => EigaEpisode.fromJson(e as Map<String, dynamic>))
              .toList(),
      image:
          json['image'] != null
              ? OImage.fromJson(json['image'] as Map<String, dynamic>)
              : null,
      poster:
          json['poster'] != null
              ? OImage.fromJson(json['poster'] as Map<String, dynamic>)
              : null,
      schedule:
          json['schedule'] != null
              ? TimeAndDay.fromJson(json['schedule'] as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'episodes': episodes.map((e) => e.toJson()).toList(),
      'image': image?.toJson(),
      'poster': poster?.toJson(),
      'schedule': schedule?.toJson(),
    };
  }
}

class TimeAndDay {
  final int day;
  final int hour;
  final int minute;

  TimeAndDay({required this.day, required this.hour, required this.minute});

  factory TimeAndDay.fromJson(Map<String, dynamic> json) {
    return TimeAndDay(
      day: json['day'] as int,
      hour: json['hour'] as int,
      minute: json['minute'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {'day': day, 'hour': hour, 'minute': minute};
  }
}
