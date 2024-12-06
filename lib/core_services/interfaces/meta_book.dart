import 'package:honyomi/core_services/interfaces/basic_image.dart';
import 'package:honyomi/core_services/interfaces/rate_value.dart';
import 'package:honyomi/core_services/interfaces/route.dart';

class MetaBook {
  final String name;
  final String? originalName;

  final BasicImage image;

  final String? author;
  final String? translator;
  final String? status;

  final int? views;
  final int? likes;

  final RateValue? rate;
  final Iterable<Route> genres;
  final String description;
  final Iterable<Chapter> chapters;
  final DateTime lastModified;

  MetaBook({
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

  // Convert from JSON
  factory MetaBook.fromJson(Map<String, dynamic> json) {
    return MetaBook(
      name: json['name'],
      originalName: json['originalName'],
      image: BasicImage.fromJson(json['image']),
      author: json['author'],
      translator: json['translator'],
      status: json['status'],
      views: json['views'],
      likes: json['likes'],
      rate: json['rate'] != null ? RateValue.fromJson(json['rate']) : null,
      genres: (json['genres'] as List).map((e) => Route.fromJson(e)),
      description: json['description'],
      chapters: (json['chapters'] as List).map((e) => Chapter.fromJson(e)),
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
      'status': status,
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

class Chapter extends Route {
  final DateTime? time;

  Chapter({
    required super.name,
    required super.slug,
    this.time,
  });

  // Convert from JSON
  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      name: json['name'],
      slug: json['slug'],
      time: json['time'] != null ? DateTime.parse(json['time']) : null,
    );
  }

  // Convert to JSON
  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'slug': slug,
      'time': time?.toIso8601String(),
    };
  }
}
