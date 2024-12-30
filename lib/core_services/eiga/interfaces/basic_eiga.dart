import 'package:honyomi/core_services/eiga/interfaces/basic_episode.dart';
import 'package:honyomi/core_services/interfaces/basic_image.dart';

class BasicEiga {
  final String name;
  final String eigaId;
  final String? originalName;
  final BasicImage image;
  final BasicEpisode? lastEpisode;
  final DateTime? timeAgo;
  final String? notice;
  final double? rate;
  final bool pending;
  final DateTime? preRelease;

  BasicEiga(
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

  factory BasicEiga.createFakeData() {
    return BasicEiga(
      name: 'Eiga Fake',
      eigaId: 'eiga-fake-id',
      originalName: 'Eiga Fake Original',
      image: BasicImage.createFakeData(),
      lastEpisode: BasicEpisode.createFakeData(),
      timeAgo: DateTime.now().subtract(Duration(days: 7)),
      notice: 'Notice Fake',
      rate: 8.5,
      pending: true,
      preRelease: DateTime.now().add(Duration(days: 30)),
    );
  }
}
