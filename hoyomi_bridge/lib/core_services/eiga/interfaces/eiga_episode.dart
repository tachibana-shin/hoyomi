import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:eval_annotation/eval_annotation.dart';

part 'eiga_episode.freezed.dart';
part 'eiga_episode.g.dart';

@freezed
@Bind()
sealed class EigaEpisode with _$EigaEpisode {
  const factory EigaEpisode({
    required String name,
    required String episodeId,
    OImage? image,
    String? description,
    String? extra,
    @Default(-1) int order,
  }) = _EigaEpisode;

  static const trailerId = 'trailer-0';

  factory EigaEpisode.fromJson(Map<String, dynamic> json) =>
      _$EigaEpisodeFromJson(json);

  factory EigaEpisode.createFakeData() {
    return EigaEpisode(name: "Episode 1", episodeId: "1");
  }
}

extension EigaChapterListExt on List<EigaEpisode> {
  static final _sortedCache = Expando<List<EigaEpisode>>();

  List<EigaEpisode> get sortAsc {
    return _sortedCache[this] ??= [...this]
      ..sort((a, b) => a.order.compareTo(b.order));
  }
}
