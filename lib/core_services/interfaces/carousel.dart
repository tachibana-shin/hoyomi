import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/eiga/interfaces/carousel_item.dart';
import 'package:hoyomi/core_services/interfaces/genre.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';
import 'package:mediaquery_sizer/mediaquery_sizer.dart';

class Carousel {
  final List<CarouselItem> items;
  final double aspectRatio;
  final double Function(BuildContext context) maxHeightBuilder;

  const Carousel(
      {required this.items,
      required this.aspectRatio,
      required this.maxHeightBuilder});

  factory Carousel.createFakeData() {
    return Carousel(items: [
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
    ], aspectRatio: 404 / 720, maxHeightBuilder: (context) => 30.h(context));
  }
}
