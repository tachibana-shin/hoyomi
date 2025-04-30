import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi/core_services/interfaces/genre.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';

part 'eiga_carousel_item.freezed.dart';
part 'eiga_carousel_item.g.dart';

@freezed
sealed class EigaCarouselItem with _$EigaCarouselItem {
  const factory EigaCarouselItem({
    String? subText,
    required OImage image,
    required String eigaId,
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
  }) = _EigaCarouselItem;

  factory EigaCarouselItem.fromJson(Map<String, dynamic> json) =>
      _$EigaCarouselItemFromJson(json);
}
