import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga_carousel_item.dart';
import 'package:hoyomi/core_services/interfaces/genre.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';

part 'eiga_carousel.freezed.dart';
part 'eiga_carousel.g.dart';

@freezed
sealed class EigaCarousel with _$EigaCarousel {
  const factory EigaCarousel({
    required List<EigaCarouselItem> items,
    required double aspectRatio,
    required double maxHeightBuilder,
  }) = _EigaCarousel;

  factory EigaCarousel.fromJson(Map<String, dynamic> json) =>
      _$EigaCarouselFromJson(json);

  factory EigaCarousel.createFakeData() {
    return EigaCarousel(
      items: [
        EigaCarouselItem(
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
