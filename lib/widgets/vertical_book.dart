import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:honyomi/core_services/interfaces/basic_book.dart';
import 'package:honyomi/utils/format_time_ago.dart';
import 'package:honyomi/widgets/circular_progress.dart';

class VerticalBook extends StatelessWidget {
  final BasicBook book;
  final String sourceId;
  final double? percentRead;

  const VerticalBook(
      {super.key,
      required this.book,
      required this.sourceId,
      this.percentRead});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          context.push("/details_comic/$sourceId/${book.bookId}");
        },
        splashColor: Colors.white70.withOpacity(0.3),
        highlightColor: Colors.white70.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.0),
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          color: Colors.transparent,
          elevation: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 2 / 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        book.image.src,
                        headers: book.image.headers,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // top
                  if (book.notice != null || book.rate != null)
                    Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                            padding: const EdgeInsets.only(
                                bottom: 16.0, left: 8.0, right: 8.0, top: 4.0),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black.withOpacity(0.5),
                                  Colors.transparent,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  if (book.notice != null)
                                    Text(
                                      book.notice!,
                                      style: const TextStyle(
                                          fontSize: 12.0, color: Colors.orange),
                                    )
                                  else
                                    Text(""),
                                  if (book.rate != null)
                                    Row(
                                      children: [
                                        Icon(
                                          MaterialCommunityIcons.star,
                                          color: Colors.blue.shade200,
                                          size: 16.0,
                                        ),
                                        const SizedBox(width: 4.0),
                                        Text(
                                          book.rate!.toString(),
                                          style: const TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                ]))),

                  // bottom
                  if (book.timeAgo != null)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                          padding: const EdgeInsets.only(
                              top: 16.0, left: 8.0, right: 8.0, bottom: 4.0),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.8),
                                Colors.transparent,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Text(
                            formatTimeAgo(book.timeAgo!),
                            style: TextStyle(
                                fontSize: 12.0, color: Colors.blueGrey.shade50),
                          )),
                      //  Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       if (book.rate != null)
                      //         Row(
                      //           children: [
                      //             Icon(
                      //               Icons.star,
                      //               color: Colors.yellow[700],
                      //               size: 16.0,
                      //             ),
                      //             const SizedBox(width: 4.0),
                      //             Text(
                      //               book.rate!.toString(),
                      //               style: const TextStyle(
                      //                   fontSize: 14.0, color: Colors.white),
                      //             ),
                      //           ],
                      //         ),
                      //       if (book.notice != null)
                      //         Text(
                      //           book.notice!,
                      //           style: const TextStyle(
                      //               fontSize: 12.0, color: Colors.orange),
                      //         ),
                      //     ])),
                    ),

                  // progress read
                  if (percentRead != null)
                    CircularProgress(
                        value: percentRead!,
                        strokeWidth: 3.0,
                        textStyle: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.surface,
                        ),
                        borderColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).colorScheme.surface,
                        ),
                        backgroundBorder: Colors.transparent,
                        backgroundColor:
                            Theme.of(context).colorScheme.tertiaryContainer,
                        size: 25),
                ],
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                  child: Container(
                      constraints: BoxConstraints(
                        minHeight: 40.0,
                      ),
                      child: Text(
                        book.name,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey.shade300,
                            fontWeight: FontWeight.w500),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ))),
              if (book.lastChap != null)
                Text(
                  book.lastChap?.name ?? 'N/A',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 12.0, color: Colors.grey.shade500),
                ),
            ],
          ),
        ));
  }
}
