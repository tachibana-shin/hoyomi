import 'package:flutter/material.dart';
import 'package:honyomi/core_services/eiga/interfaces/basic_carousel_item.dart';

class BasicCarousel {
  final List<BasicCarouselItem> items;
  final double aspectRatio;
  final double Function(BuildContext context) maxHeightBuilder;

  const BasicCarousel(
      {required this.items,
      required this.aspectRatio,
      required this.maxHeightBuilder});
}
