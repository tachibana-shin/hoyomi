import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi/core_services/interfaces/genre.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';

part 'comic_carousel_item.freezed.dart';
part 'comic_carousel_item.g.dart';

@freezed
sealed class ComicCarouselItem with _$ComicCarouselItem {
  const factory ComicCarouselItem({
    String? subText,
    required OImage image,
    required String comicId,
    required String name,
    String? originalName,
    String? type,
    String? episodeDuration,
    DateTime? updatedAt,
    String? quality,
    int? countSub,
    int? countDub,
    double? rate,
    String? notice,
    String? year,
    String? description,
    String? studio,
    String? duration,
    String? language,
    List<Genre>? genres,
    List<Genre>? actors,
  }) = _ComicCarouselItem;

  factory ComicCarouselItem.fromJson(Map<String, dynamic> json) =>
      _$ComicCarouselItemFromJson(json);
}
