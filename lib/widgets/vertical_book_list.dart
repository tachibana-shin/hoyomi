import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:honyomi/core_services/base_service.dart';
import 'package:honyomi/core_services/interfaces/basic_book.dart';
import 'vertical_book.dart';

class VerticalBookList extends StatelessWidget {
  final Future<Iterable<BasicBook>>? booksFuture;
  final Iterable<BasicBook>? books;
  final BaseService service;
  final String title;
  final String? more;
  final bool noHeader;

  VerticalBookList(
      {super.key,
      required this.booksFuture,
      required this.books,
      required this.service,
      required this.title,
      required this.more,
      this.noHeader = false}) {
    if (booksFuture == null && books == null) {
      throw ArgumentError('Either booksFuture or books must be provided.');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (noHeader == true && booksFuture == null) {
      return _buildGridView(context, books!);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (noHeader != true)
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            if (more != null)
              ElevatedButton(
                  onPressed: () {
                    context.push(more!);
                  },
                  child: Text('More'))
          ]),
        if (noHeader != true) const SizedBox(height: 8.0),
        if (booksFuture != null)
          FutureBuilder(
            future: booksFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                if (service.isCaptchaError(snapshot.error)) {
                  return Center(
                      child: service.templateCaptchaResolver(context));
                }

                return Center(child: Text('Error: ${snapshot.error}'));
              }
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No data available'));
              }

              return _buildGridView(context, snapshot.data!);
            },
          )
        else
          _buildGridView(context, books!)
      ],
    );
  }

  Widget _buildGridView(BuildContext context, Iterable<BasicBook> books) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount;

    if (screenWidth <= 600) {
      crossAxisCount = 3;
    } else if (screenWidth <= 900) {
      crossAxisCount = 4;
    } else {
      crossAxisCount = 6;
    }

    return DynamicHeightGridView(
      shrinkWrap: true,
      // padding: const EdgeInsets.all(8.0),
      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: 0.0,
      mainAxisSpacing: 10.0,
      //   childAspectRatio: 1/3,
      // ),
      itemCount: books.length,
      builder: (context, bookIndex) {
        final book = books.elementAt(bookIndex);
        return VerticalBook(book: book, sourceId: service.uid);
      },
    );
  }
}
