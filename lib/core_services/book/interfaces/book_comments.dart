import 'package:hoyomi/core_services/book/interfaces/book_comment.dart';
import 'package:hoyomi/core_services/interfaces/paginate.dart';

class BookComments extends Paginate<BookComment> {
  BookComments(
      {required super.items,
      required super.page,
      required super.totalItems,
      required super.totalPages});
}
