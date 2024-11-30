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
  final Future<int>? totalItems;

  const HorizontalBookList(
      {super.key,
      required this.booksFuture,
      required this.service,
      required this.title,
      required this.more,
      this.totalItems});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment : CrossAxisAlignment.start,
                children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                if (totalItems != null)
                  FutureBuilder(
                      future: totalItems!,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(children: [
                            SizedBox(height: 2),
                            Text(
                              "${snapshot.data} results",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.white70),
                            ),
                          ]);
                        }

                        return Stack(children: []);
                      })
              ])),
          ElevatedButton(
              onPressed: () {
                context.push(more);
              },
              child: Text('More'))
        ]),
        FutureBuilder<Iterable<BasicBook>>(
          future: booksFuture,
          builder: (context, snapshot) {
            final childAspectRatio = 118.0 / 236.0;
            final viewportFraction = 0.2857;
            final height = 1 /
                childAspectRatio *
                (MediaQuery.of(context).size.width) *
                viewportFraction;

            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                  height: height,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ));
            }
            if (snapshot.hasError) {
              if (service.isCaptchaError(snapshot.error)) {
                return SizedBox(
                    height: height,
                    child: Center(
                        child: service.templateCaptchaResolver(context)));
              }

              return SizedBox(
                  height: height,
                  child: Center(
                    child: Text('Error: ${snapshot.error}'),
                  ));
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return SizedBox(
                  height: height,
                  child: Center(
                    child: Text('No data available.'),
                  ));
            }

            final books = snapshot.data!;
            return SizedBox(
              height: height,
              child: PageView.builder(
                itemCount: books.length,
                allowImplicitScrolling: true,
                padEnds: false,
                controller: PageController(
                  viewportFraction: viewportFraction,
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
