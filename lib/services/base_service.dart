import 'package:honyomi/services/interfaces/basic_image.dart';
import 'package:honyomi/services/interfaces/basic_section.dart';
import 'package:honyomi/services/interfaces/meta_book.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

abstract class UtilsService {
  String get name;
  String get uid => name.toLowerCase().replaceAll(r"\s", "-");

  Future<String> fetchData(String url) async {
    http.Response response = await http.get(Uri.parse(url), headers: {
      'cache-control': 'no-cache',
      'dnt': '1',
      'pragma': 'no-cache',
      'priority': 'u=0, i',
      'sec-ch-ua':
          '"Google Chrome";v="131", "Chromium";v="131", "Not_A Brand";v="24"',
      'sec-ch-ua-mobile': '?0',
      'sec-ch-ua-platform': '"Windows"',
      'sec-fetch-dest': 'document',
      'sec-fetch-mode': 'navigate',
      'sec-fetch-site': 'none',
      'sec-fetch-user': '?1',
      'sec-gpc': '1',
      'upgrade-insecure-requests': '1',
      'cookie':
          "type_book=1; setting_dark_mode=dark; GSession=ck0msqt83s4407d31fbrul9ggt; SL_G_WPT_TO=vi; SL_GWPT_Show_Hide_tmp=1; SL_wptGlobTipTmp=1",
      'user-agent':
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'
    });
    if (response.statusCode == 429) {
      // Tp 429, wait 1 seconds
      await Future.delayed(Duration(seconds: 1)); // Wait 1 second
      return fetchData(url); // Retry fetching data
    }

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
  String get uid;

  Future<Iterable<BasicSection>> home();
  Future<MetaBook> getDetails(String slug);
  Future<Iterable<BasicImage>> getPages(String manga, String chap);
  String getURL(String comicId, String chapterId);
}
