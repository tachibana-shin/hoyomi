import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoyomi/core_services/book/interfaces/basic_book.dart';
import 'package:hoyomi/core_services/utils_service.dart';
import 'package:hoyomi/widgets/horizontal_list.dart';
import 'vertical_book.dart';

class BasicBookExtend {
  final BasicBook book;
  final String? sourceId;
  final double? percentRead;

  BasicBookExtend(
      {required this.book, required this.sourceId, this.percentRead});
}

class HorizontalBookList extends StatelessWidget {
  final Future<List<BasicBookExtend>> itemsFuture;
  final Function()? onTapChild;
  final String title;
  final String? subtitle;
  final String? more;

  const HorizontalBookList({
    super.key,
    required this.itemsFuture,
    this.onTapChild,
    required this.title,
    this.subtitle,
    this.more,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: itemsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return HorizontalList<BasicBookExtend>(
              title: title,
              subtitle: subtitle,
              more: more,
              items: List.generate(
                  30,
                  (index) => BasicBookExtend(
                      book: BasicBook.createFakeData(), sourceId: null)),
              needSubtitle: false,
              builder: (context, book, index) {
                return VerticalBook(
                  book: book.book,
                  sourceId: book.sourceId,
                  percentRead: book.percentRead,
                );
              },
            );
          }

          if (snapshot.hasError) {
            return Center(
                child: UtilsService.errorWidgetBuilder(context,
                    error: snapshot.error,
                    orElse: (error) => Text('Error: $error')));
          }

          return HorizontalList<BasicBookExtend>(
            title: title,
            subtitle: subtitle,
            more: more,
            items: snapshot.data!,
            needSubtitle: snapshot.data!.firstWhereOrNull(
                    (book) => VerticalBook.checkNeedSubtitle(book.book)) !=
                null,
            builder: (context, book, index) {
              return VerticalBook(
                book: book.book,
                sourceId: book.sourceId,
                percentRead: book.percentRead,
              );
            },
          );
        });
  }
}
