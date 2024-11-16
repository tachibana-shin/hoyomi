import 'package:honyomi/services/interfaces/basic_section.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

class UtilsService {
  Future<String> fetchData(String url) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Document parseDocument(String html) {
    return parse(html);
  }

  Future<Document> fetchDocument(String url) async {
    return parseDocument(await fetchData(url));
  }
}

abstract class BaseService {
  String get name;

  Future<Iterable<BasicSection>> home();
}
