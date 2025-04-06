import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';

part 'genre.freezed.dart';
part 'genre.g.dart';

@freezed
class Genre with _$Genre {
  static const String noId = '\$_no_id_\$';

  const factory Genre({
    required String name,
    required String genreId,
    String? description,
    OImage? image,
  }) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  factory Genre.createFakeData() {
    return Genre(
      name: "Action",
      genreId: "1",
      description: "Action-packed genre with intense battles.",
      image: OImage.createFakeData(),
    );
  }
}
