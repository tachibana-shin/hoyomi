import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/book/interfaces/basic_book.dart';
import 'package:hoyomi/core_services/utils_service.dart';
import 'package:hoyomi/widgets/book/horizontal_book_list.dart';
import 'package:hoyomi/widgets/vertical_list.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'vertical_book.dart';

class VerticalBookList extends StatelessWidget {
  final Future<List<BasicBookExtend>> itemsFuture;
  final String title;
  final String? subtitle;
  final String? more;

  const VerticalBookList(
      {super.key,
      required this.itemsFuture,
      required this.title,
      this.subtitle,
      this.more});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: itemsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Skeletonizer(
                enabled: true,
                enableSwitchAnimation: true,
                child: VerticalList<BasicBookExtend>(
                  title: title,
                  subtitle: subtitle,
                  more: more,
                  items: List.generate(
                      30,
                      (index) => BasicBookExtend(
                          book: BasicBook.createFakeData(), sourceId: null)),
                  builder: (context, book, index) {
                    return VerticalBook(
                      book: book.book,
                      sourceId: book.sourceId,
                      percentRead: book.percentRead,
                    );
                  },
                ));
          }

          if (snapshot.hasError) {
            return Center(
                child: UtilsService.errorWidgetBuilder(context,
                    error: snapshot.error,
                    orElse: (error) => Text('Error: $error')));
          }

          return VerticalList<BasicBookExtend>(
            title: title,
            subtitle: subtitle,
            more: more,
            items: snapshot.data!,
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
