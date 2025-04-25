import 'package:dio/dio.dart';

Future<Dio> createDioClient(BaseOptions? options) async {
  final dio = Dio(options);
  return dio;
}

Future<void> initializeDioClient() async {}
