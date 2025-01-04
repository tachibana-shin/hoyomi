import 'package:hoyomi/core_services/book/interfaces/basic_comment.dart';
import 'package:hoyomi/core_services/book/interfaces/paginate.dart';

class BaseComments extends Paginate<BasicComment> {
  BaseComments(
      {required super.items,
      required super.page,
      required super.totalItems,
      required super.totalPages});
}
