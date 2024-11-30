import 'package:honyomi/core_services/interfaces/basic_book.dart';
import 'package:honyomi/core_services/interfaces/paginate.dart';

class BaseSection extends Paginate<BasicBook> {
  final String name;

  const BaseSection(
      {required this.name,
      required super.items,
      required super.page,
      required super.totalItems,
      required super.totalPages});
}
