import 'package:hoyomi/core_services/book/interfaces/book_chapter.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';
import 'package:hoyomi/core_services/book/interfaces/meta_book.dart';

class Book {
  final String name;
  final String bookId;
  final String? originalName;
  final OImage image;
  final BookChapter? lastChap;
  final DateTime? timeAgo;
  final String? notice;
  final double? rate;

  Book({
    required this.name,
    required this.bookId,
    required this.originalName,
    required this.image,
    required this.lastChap,
    required this.timeAgo,
    required this.notice,
    required this.rate,
  });

  factory Book.fromMeta(String bookId, {required MetaBook book}) {
    return Book(
      name: book.name,
      bookId: bookId,
      originalName: book.originalName,
      image: book.image,
      lastChap: null,
      timeAgo: null,
      notice: null,
      rate: book.rate?.value,
    );
  }

  factory Book.createFakeData() {
    return Book(
        name: 'Dragon Ball Daima',
        bookId: 'eiga-fake-id',
        originalName: null,
        image: OImage.createFakeData(),
        lastChap: null,
        timeAgo: null,
        notice: 'Notice Fake',
        rate: 8.5);
  }
}
