import 'package:dio/dio.dart';
import 'package:dio_compatibility_layer/dio_compatibility_layer.dart';
import 'package:rhttp_plus/rhttp_plus.dart';

Future<Dio> createDioClient(
  BaseOptions? options, {
  followRedirects = false,
}) async {
  final dio = Dio(options);
  final compatibleClient = await RhttpCompatibleClient.create(
    settings: ClientSettings(
      emulator: Emulation.chrome136,
      cookieSettings: CookieSettings(storeCookies: true),
      redirectSettings: followRedirects ? RedirectSettings.limited(5) : null,
    ),
  );
  dio.httpClientAdapter = ConversionLayerAdapter(compatibleClient);
  return dio;
}

Future<void> initializeDioClient() async {
  await Rhttp.init();
}
