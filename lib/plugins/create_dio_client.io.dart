import 'package:dio/dio.dart';
import 'package:dio_compatibility_layer/dio_compatibility_layer.dart';
import 'package:rhttp/rhttp.dart';

Future<Dio> createDioClient(BaseOptions? options) async {
  final dio = Dio(options);
  final compatibleClient = await RhttpCompatibleClient.create(
    settings: ClientSettings(
      tlsSettings: TlsSettings(),
      cookieSettings: CookieSettings(storeCookies: true),
    ),
  );
  dio.httpClientAdapter = ConversionLayerAdapter(compatibleClient);
  return dio;
}

Future<void> initializeDioClient() async {
  await Rhttp.init();
}
