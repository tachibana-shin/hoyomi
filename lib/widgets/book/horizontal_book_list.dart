import 'package:flutter/material.dart';
import 'package:honyomi/core_services/book/interfaces/basic_book.dart';
import 'package:honyomi/core_services/utils_service.dart';
import 'package:honyomi/widgets/horizontal_list.dart';
import 'vertical_book.dart';

class BasicBookExtend {
  final BasicBook book;
  final String sourceId;
  final double? percentRead;

  BasicBookExtend(
      {required this.book, required this.sourceId, this.percentRead});
}

class HorizontalBookList extends StatelessWidget {
  final List<BasicBookExtend>? items;
  final Future<List<BasicBookExtend>>? itemsFuture;
  final Function()? onTapChild;
  final String title;
  final String? more;
  final Future<int>? totalItems;

  const HorizontalBookList({
    super.key,
    this.items,
    this.itemsFuture,
    this.onTapChild,
    required this.title,
    required this.more,
    this.totalItems,
  }) : assert(items != null || itemsFuture != null);

  @override
  Widget build(BuildContext context) {
    return HorizontalList(
      title: title,
      more: more,
      items: items,
      itemsFuture: itemsFuture,
      builder: (context, book, index) {
        return VerticalBook(
          book: book.book,
          sourceId: book.sourceId,
          percentRead:
              book.percentRead == null ? null : Future.value(book.percentRead),
        );
      },
      builderError: (Object? error) {
        return Center(
            child: UtilsService.errorWidgetBuilder(context,
                error: error, orElse: (error) => Text('Error: $error')));
      },
      totalFuture: totalItems,
    );
  }
}
