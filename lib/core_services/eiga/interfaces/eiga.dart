import 'package:hoyomi/core_services/eiga/interfaces/eiga_episode.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';

class Eiga {
  final String name;
  final String eigaId;
  final String? originalName;
  final OImage image;
  final EigaEpisode? lastEpisode;
  final DateTime? timeAgo;
  final String? notice;
  final double? rate;
  final bool pending;
  final DateTime? preRelease;

  Eiga(
      {required this.name,
      required this.eigaId,
      required this.originalName,
      required this.image,
      required this.lastEpisode,
      required this.timeAgo,
      required this.notice,
      required this.rate,
      this.pending = false,
      this.preRelease});

  factory Eiga.createFakeData() {
    return Eiga(
        name: 'Dragon Ball Daima',
        eigaId: 'eiga-fake-id',
        originalName: null,
        image: OImage.createFakeData(),
        lastEpisode: null,
        timeAgo: null,
        notice: 'Notice Fake',
        rate: 8.5);
  }
}
