import 'package:honyomi/core_services/interfaces/basic_comment.dart';
import 'package:honyomi/core_services/interfaces/paginate.dart';

class BaseComments extends Paginate<BasicComment> {
  BaseComments(
      {required super.items,
      required super.page,
      required super.totalItems,
      required super.totalPages});
}
