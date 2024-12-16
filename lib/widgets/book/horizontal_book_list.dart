import 'package:flutter/material.dart';
import 'package:honyomi/core_services/book/book_base_service.dart';
import 'package:honyomi/core_services/book/interfaces/basic_book.dart';
import 'package:honyomi/widgets/horizontal_list.dart';
import 'vertical_book.dart';

class HorizontalBookList extends StatelessWidget {
  final Iterable<BasicBook>? items;
  final Future<Iterable<BasicBook>> itemsFuture;
  final BookBaseService? service;
  final String Function(int index)? getService;
  final double Function(int index)? getPercentRead;
  final Function()? onTapChild;
  final String title;
  final String? more;
  final Future<int>? totalItems;

  const HorizontalBookList({
    super.key,
    this.items,
    required this.itemsFuture,
    required this.service,
    this.getService,
    this.getPercentRead,
    this.onTapChild,
    required this.title,
    required this.more,
    this.totalItems,
  });

  @override
  Widget build(BuildContext context) {
    return HorizontalList(
      title: title,
      more: more,
      items: items,
      itemsFuture: itemsFuture,
      builder: (context, eiga, index) {
        return VerticalBook(
          book: eiga,
          sourceId: service?.uid ?? getService!(index),
          percentRead: getPercentRead != null ? getPercentRead!(index) : null,
        );
      },
      builderError: (Object? error) {
        if (service?.isCaptchaError(error) == true) {
          return Center(child: service?.templateCaptchaResolver(context));
        }
        return null;
      }, totalFuture: totalItems,
    );
  }
}
