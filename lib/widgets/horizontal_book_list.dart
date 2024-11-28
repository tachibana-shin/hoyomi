import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:honyomi/core_services/base_service.dart';
import 'package:honyomi/core_services/interfaces/basic_book.dart';
import 'vertical_book.dart';

class HorizontalBookList extends StatelessWidget {
  final Future<Iterable<BasicBook>> booksFuture;
  final BaseService service;
  final String title;
  final String more;

  const HorizontalBookList({
    super.key,
    required this.booksFuture,
    required this.service,
    required this.title,
    required this.more
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment : MainAxisAlignment.spaceBetween,
          children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          ElevatedButton(onPressed: () {
            context.push(more);
          }, child: Text('More'))
        ]),
        const SizedBox(height: 8.0),
        FutureBuilder<Iterable<BasicBook>>(
          future: booksFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                  height: 250.0,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ));
            }
            if (snapshot.hasError) {
              if (service.isCaptchaError(snapshot.error)) {
                return SizedBox(
                    height: 250.0,
                    child: Center(
                        child: service.templateCaptchaResolver(context)));
              }

              return SizedBox(
                  height: 250.0,
                  child: Center(
                    child: Text('Error: ${snapshot.error}'),
                  ));
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return SizedBox(
                  height: 250.0,
                  child: Center(
                    child: Text('No data available.'),
                  ));
            }

            final books = snapshot.data!;
            return SizedBox(
              height: 250.0,
              child: PageView.builder(
                itemCount: books.length,
                allowImplicitScrolling: true,
                padEnds: false,
                controller: PageController(
                  viewportFraction: 0.2857,
                  initialPage: 0,
                ),
                itemBuilder: (context, index) {
                  final book = books.elementAt(index);
                  return VerticalBook(
                    book: book,
                    sourceId: service.uid,
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
