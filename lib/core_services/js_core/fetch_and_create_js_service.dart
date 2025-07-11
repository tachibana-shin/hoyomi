import 'package:dio/dio.dart';
import 'package:hoyomi/core_services/js_core/create_js_service.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/logic/normalize_plugin_url.dart';

final _dio = Dio();
Future<(Service, String)> fetchAndCreateJsService(String url) async {
  final normalizedUrl = normalizePluginUrl(url.trim());
  final response = await _dio.get<String>(normalizedUrl);

  if (response.data == null || response.data!.trim().isEmpty) {
    throw Exception('Empty JS content from $normalizedUrl');
  }

  final jsCode = '''// @install_url = $url;\n${response.data}''';

  final service = await createJsService(jsCode: jsCode);
  return (service, jsCode);
}
