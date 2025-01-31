import 'package:hoyomi/core_services/interfaces/basic_filter.dart';
import 'package:hoyomi/core_services/interfaces/paginate.dart';
import 'package:hoyomi/core_services/eiga/interfaces/basic_eiga.dart';

class BaseEigaSection extends Paginate<BasicEiga> {
  final String name;
  final String url;
  final String? description;
  final List<BasicFilter>? filters;

  const BaseEigaSection(
      {required this.name,
      required this.url,
      this.description,
      required super.items,
      required super.page,
      required super.totalItems,
      required super.totalPages,
      this.filters});
}
