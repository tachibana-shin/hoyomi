import 'package:honyomi/services/base_service.dart';
import 'package:honyomi/services/interfaces/basic_section.dart';
import 'package:html/dom.dart';

import 'utils/parse_basic_book.dart';

class TruyenGGService extends UtilsService implements BaseService {
  @override
  final String name = "TruyenGG";

  String get baseUrl => "https://truyengg.com";

  @override
  Future<Iterable<BasicSection>> home() async {
    final Document document = await fetchDocument(baseUrl);

    final sections = document.querySelectorAll(".list_item_home");

    return [
      BasicSection(
          books: sections[0]
              .querySelectorAll(".item_home")
              .map((element) => parseBasicBook(element, baseUrl)),
          name: 'Mới Cập Nhật',
          slug: 'truyen-moi-cap-nhat'),
      BasicSection(
          books: sections[1]
              .querySelectorAll(".item_home")
              .map((element) => parseBasicBook(element, baseUrl)),
          name: "Bình Chọn",
          slug: "top-binh-chon"),
      BasicSection(
          books: sections[2]
              .querySelectorAll(".item_home")
              .map((element) => parseBasicBook(element, baseUrl)),
          name: "Xem Nhiều",
          slug: "top-thang")
    ];
  }
}
