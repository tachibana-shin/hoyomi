import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic_carousel_item.dart';
import 'package:hoyomi/core_services/interfaces/genre.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';

part 'comic_carousel.freezed.dart';
part 'comic_carousel.g.dart';

@freezed
sealed class ComicCarousel with _$ComicCarousel {
  const factory ComicCarousel({
    required List<ComicCarouselItem> items,
    required double aspectRatio,
    required double maxHeightBuilder,
  }) = _ComicCarousel;

  factory ComicCarousel.fromJson(Map<String, dynamic> json) =>
      _$ComicCarouselFromJson(json);

  factory ComicCarousel.createFakeData() {
    return ComicCarousel(
      items: [
        ComicCarouselItem(
          image: OImage.createFakeData(),
          comicId: 'comic1',
          name: 'Comic 1',
          originalName: 'Comic 1 Original',
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
