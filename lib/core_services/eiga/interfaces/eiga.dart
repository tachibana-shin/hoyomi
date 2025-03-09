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
  final String? description;

  Eiga({
    required this.name,
    required this.eigaId,
    this.originalName,
    required this.image,
    this.lastEpisode,
    this.timeAgo,
    this.notice,
    this.rate,
    this.pending = false,
    this.preRelease,
    this.description
  });

  factory Eiga.createFakeData() {
    return Eiga(
      name: 'Dragon Ball Daima',
      eigaId: 'eiga-fake-id',
      originalName: null,
      image: OImage.createFakeData(),
      lastEpisode: null,
      timeAgo: null,
      notice: 'Notice Fake',
      rate: 8.5,
    );
  }
}
