import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi/core_services/interfaces/genre.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';

part 'meta_eiga.freezed.dart';
part 'meta_eiga.g.dart';

@freezed
sealed class Season with _$Season {
  const factory Season({
    required String name,
    required String eigaId,
  }) = _Season;

  factory Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);
}

@freezed
sealed class MetaEiga with _$MetaEiga {
  const factory MetaEiga({
    required String name,
    String? originalName,
    required OImage image,
    OImage? poster,
    required String description,
    double? rate,
    int? countRate,
    int? countSub,
    int? countDub,
    String? duration,
    int? yearOf,
    int? views,
    required List<Season> seasons,
    required List<Genre> genres,
    String? quality,
    List<Genre>? authors,
    List<Genre>? countries,
    String? language,
    List<Genre>? studios,
    Genre? movieSeason,
    String? trailer,
    @Default(false) bool fake,
  }) = _MetaEiga;

  factory MetaEiga.fromJson(Map<String, dynamic> json) =>
      _$MetaEigaFromJson(json);

  /// Fake data generator
  factory MetaEiga.createFakeData() {
    return MetaEiga(
      name: '5-toubun no Hanayome',
      originalName: '5-toubun no Hanayome',
      image: OImage.createFakeData(),
      poster: OImage.createFakeData(),
      description: 'This is a fake movie description.',
      rate: 8.5,
      countRate: 1200,
      duration: '2h 30m',
      yearOf: 2023,
      views: 500000,
      seasons: [
        Season(name: 'Season 1', eigaId: 'S1'),
        Season(name: 'Season 2', eigaId: 'S2'),
      ],
      genres: [
        Genre(name: 'Action', genreId: Genre.noId),
        Genre(name: 'Drama', genreId: Genre.noId),
      ],
      quality: 'HD',
      authors: [Genre(name: 'John Doe', genreId: Genre.noId)],
      countries: [Genre(name: 'Japan', genreId: Genre.noId)],
      language: 'English',
      studios: [Genre(name: 'Studio Ghibli', genreId: Genre.noId)],
      movieSeason: Genre(name: 'Spring', genreId: Genre.noId),
      fake: true,
    );
  }
}
