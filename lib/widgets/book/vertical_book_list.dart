import 'package:flutter/material.dart';
import 'package:honyomi/core_services/book/book_base_service.dart';
import 'package:honyomi/core_services/book/interfaces/basic_book.dart';
import 'package:honyomi/widgets/vertical_list.dart';
import 'vertical_book.dart';

class VerticalBookList extends StatelessWidget {
  final Future<List<BasicBook>>? itemsFuture;
  final List<BasicBook>? items;
  final BookBaseService? service;
  final String Function(int index)? getService;
  final double Function(int index)? getPercentRead;
  final String title;
  final String? more;
  final bool noHeader;

  VerticalBookList(
      {super.key,
      required this.itemsFuture,
      required this.items,
      required this.service,
      this.getService,
      required this.title,
      required this.more,
      this.noHeader = false,
      this.getPercentRead}) {
    if (itemsFuture == null && items == null) {
      throw ArgumentError('Either booksFuture or books must be provided.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return VerticalList(
      title: title,
      more: more,
      items: items,
      itemsFuture: itemsFuture,
      builder: (context, book, bookIndex) {
        return VerticalBook(
          book: book,
          sourceId: service?.uid ?? getService!(bookIndex),
          percentRead:
              getPercentRead != null ? getPercentRead!(bookIndex) : null,
        );
      },
      builderError: (Object? error) {
        if (service?.isCaptchaError(error) == true) {
          return Center(child: service?.templateCaptchaResolver(context));
        }
        return null;
      },
    );
  }
}
