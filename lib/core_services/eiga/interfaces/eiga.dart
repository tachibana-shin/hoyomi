import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga_episode.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';

part 'eiga.freezed.dart';
part 'eiga.g.dart';

@freezed
class Eiga with _$Eiga {
  const factory Eiga({
    required String name,
    required String eigaId,
    String? originalName,
    required OImage image,
    EigaEpisode? lastEpisode,
    DateTime? timeAgo,
    String? notice,
    double? rate,
    @Default(false) bool pending,
    DateTime? preRelease,
    String? description,
  }) = _Eiga;

  factory Eiga.fromJson(Map<String, dynamic> json) => _$EigaFromJson(json);

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
