import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/eiga/interfaces/basic_carousel_item.dart';
import 'package:hoyomi/core_services/interfaces/basic_genre.dart';
import 'package:hoyomi/core_services/interfaces/basic_image.dart';

class BasicCarousel {
  final List<BasicCarouselItem> items;
  final double aspectRatio;
  final double Function(BuildContext context) maxHeightBuilder;

  const BasicCarousel(
      {required this.items,
      required this.aspectRatio,
      required this.maxHeightBuilder});

  factory BasicCarousel.createFakeData() {
    return BasicCarousel(
        items: [
          BasicCarouselItem(
            image: BasicImage.createFakeData(),
            eigaId: 'eiga1',
            name: 'Eiga 1',
            originalName: 'Eiga 1 Original',
            rate: 8.5,
            notice: 'Notice 1',
            year: '2020',
            description: 'Description 1',
            studio: 'Studio 1',
            genres: [
              BasicGenre(name: 'Genre 1', genreId: 'genre1'),
              BasicGenre(name: 'Genre 2', genreId: 'genre2'),
            ],
            actors: null,
            duration: null,
          ),
        ],
        aspectRatio: 404 / 720,
        maxHeightBuilder: (context) =>
            MediaQuery.of(context).size.height * 0.3);
  }
}
