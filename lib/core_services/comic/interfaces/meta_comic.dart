import 'package:hoyomi/core_services/comic/interfaces/comic_chapter.dart';
import 'package:hoyomi/core_services/interfaces/genre.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';
import 'package:hoyomi/core_services/comic/interfaces/rate_value.dart';
import 'package:hoyomi/core_services/comic/interfaces/status_enum.dart';

class MetaComic {
  final String name;
  final String? originalName;

  final OImage image;

  final String? author;
  final String? translator;
  final StatusEnum status;

  final int? views;
  final int? likes;

  final RateValue? rate;
  final List<Genre> genres;
  final String description;
  final List<ComicChapter> chapters;
  final DateTime lastModified;

  MetaComic({
    required this.name,
    required this.originalName,
    required this.image,
    required this.author,
    required this.translator,
    required this.status,
    required this.views,
    required this.likes,
    required this.rate,
    required this.genres,
    required this.description,
    required this.chapters,
    required this.lastModified,
  });

  factory MetaComic.createFakeData() {
    return MetaComic(
      name: "Fake Comic Title",
      originalName: "フェイクコミックタイトル",
      image: OImage.createFakeData(),
      author: "Fake Author",
      translator: "Fake Translator",
      status: StatusEnum.ongoing,
      views: 100000,
      likes: 5000,
      rate: RateValue.createFakeData(),
      genres: [Genre.createFakeData(), Genre.createFakeData()],
      description: "これはダミーの説明です。",
      chapters: [ComicChapter.createFakeData(), ComicChapter.createFakeData()],
      lastModified: DateTime.now(),
    );
  }

  // Convert from JSON
  factory MetaComic.fromJson(Map<String, dynamic> json) {
    return MetaComic(
      name: json['name'],
      originalName: json['originalName'],
      image: OImage.fromJson(json['image']),
      author: json['author'],
      translator: json['translator'],
      status: StatusEnum.values.firstWhere(
        (value) => value.name == json['status'] as String,
        orElse: () => StatusEnum.unknown,
      ),
      views: json['views'],
      likes: json['likes'],
      rate: json['rate'] != null ? RateValue.fromJson(json['rate']) : null,
      genres: (json['genres'] as List).map((e) => Genre.fromJson(e)).toList(),
      description: json['description'],
      chapters: (json['chapters'] as List)
          .map((e) => ComicChapter.fromJson(e))
          .toList(),
      lastModified: DateTime.parse(json['lastModified']),
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'originalName': originalName,
      'image': image.toJson(),
      'author': author,
      'translator': translator,
      'status': status.name,
      'views': views,
      'likes': likes,
      'rate': rate?.toJson(),
      'genres': genres.map((e) => e.toJson()).toList(),
      'description': description,
      'chapters': chapters.map((e) => e.toJson()).toList(),
      'lastModified': lastModified.toIso8601String(),
    };
  }
}
