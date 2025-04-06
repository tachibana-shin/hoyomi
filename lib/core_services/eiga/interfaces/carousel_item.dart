import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi/core_services/interfaces/genre.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';

part 'carousel_item.freezed.dart';
part 'carousel_item.g.dart';

@freezed
class CarouselItem with _$CarouselItem {
  const factory CarouselItem({
    required OImage image,
    required String eigaId,
    required String name,
    String? originalName,
    double? rate,
    String? notice,
    String? year,
    String? description,
    String? studio,
    String? duration,
    String? language,
    List<Genre>? genres,
    List<Genre>? actors,
  }) = _CarouselItem;

  factory CarouselItem.fromJson(Map<String, dynamic> json) =>
      _$CarouselItemFromJson(json);
}
