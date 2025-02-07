import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/book/book_base_service.dart';
import 'package:hoyomi/core_services/book/interfaces/basic_book.dart';
import 'package:hoyomi/core_services/utils_service.dart';
import 'package:hoyomi/widgets/vertical_list.dart';
import 'vertical_book.dart';

class VerticalBookList extends StatelessWidget {
  final Future<List<BasicBook>>? itemsFuture;
  final List<BasicBook>? items;
  final BookBaseService? service;
  final ScrollController? controller;
  final String Function(int index)? getService;
  final Future<double> Function(int index)? getPercentRead;
  final String title;
  final String? more;
  final bool noHeader;

  VerticalBookList(
      {super.key,
      required this.itemsFuture,
      required this.items,
      required this.service,
      this.controller,
      this.getService,
      required this.title,
      required this.more,
      this.noHeader = false,
      this.getPercentRead}) {
    if (itemsFuture == null && items == null) {
      throw ArgumentError('Either itemsFuture or items must be provided.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return VerticalList(
      title: title,
      more: more,
      items: items,
      itemsFuture: itemsFuture,
      controller: controller,
      getDataLoading: () =>
          List.generate(30, (_) => BasicBook.createFakeData()),
      builder: (context, book, bookIndex) {
        final percentRead = getPercentRead != null
            ? getPercentRead!(bookIndex)
            : Future.value(0.0);
        return FutureBuilder(
            future: percentRead,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return VerticalBook(
                  book: book,
                  sourceId: service?.uid ?? getService!(bookIndex),
                  percentRead: snapshot.data as double,
                );
              }
              return VerticalBook(
                  book: book,
                  sourceId: service?.uid ?? getService!(bookIndex),
                  percentRead: null);
            });
      },
      builderError: (Object? error) {
        return Center(
            child: UtilsService.errorWidgetBuilder(context,
                error: error, orElse: (error) => Text('Error: $error')));
      },
    );
  }
}
