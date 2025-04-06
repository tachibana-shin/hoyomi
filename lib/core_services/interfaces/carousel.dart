import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi/core_services/eiga/interfaces/carousel_item.dart';
import 'package:hoyomi/core_services/interfaces/genre.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';

part 'carousel.freezed.dart';
part 'carousel.g.dart';

@freezed
class Carousel with _$Carousel {
  const factory Carousel({
    required List<CarouselItem> items,
    required double aspectRatio,
    required double maxHeightBuilder,
  }) = _Carousel;

  factory Carousel.fromJson(Map<String, dynamic> json) =>
      _$CarouselFromJson(json);

  factory Carousel.createFakeData() {
    return Carousel(
      items: [
        CarouselItem(
          image: OImage.createFakeData(),
          eigaId: 'eiga1',
          name: 'Eiga 1',
          originalName: 'Eiga 1 Original',
          rate: 8.5,
          notice: 'Notice 1',
          year: '2020',
          description: 'Description 1',
          studio: 'Studio 1',
          genres: [
            Genre(name: 'Genre 1', genreId: 'genre1'),
            Genre(name: 'Genre 2', genreId: 'genre2'),
          ],
          actors: null,
          duration: null,
        ),
      ],
      aspectRatio: 404 / 720,
      maxHeightBuilder: 0.3,
    );
  }
}
