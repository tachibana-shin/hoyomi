import 'dart:convert';

import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/js_runtime/js_runtime.dart';

import 'js_comic_service.dart';
import 'js_eiga_service.dart';

Future<Service> createJsService(String jsCode) async {
  final runtime = await getJsRuntime();

  await runtime.evalAsync('''!(() => {$jsCode;
      if (!globalThis.__\$HOYOMI_PLUGIN\$__) {
        throw Exception('No plugin found');
      }
      globalThis.__plugin = new globalThis.__\$HOYOMI_PLUGIN\$__();
    })();
  ''');

  final type = await runtime.evalAsync('__plugin.type');
  final init = ServiceInit.fromJson(
    await runtime.evalAsyncJson('__plugin.init'),
  );
  final $isAuth = await runtime.evalAsyncJson('__plugin.\$isAuth') ?? false;
  final writeWith = await runtime.evalAsyncJson('__plugin.writeWith') as String?;

  final service = switch (type.stringResult) {
    == 'comic' => JSComicService(runtime, init, $isAuth, writeWith: writeWith ?? 'js'),
    == 'eiga' => JSEigaService(runtime, init, $isAuth, writeWith: writeWith ?? 'js'),
    _ => throw Exception('Unknown plugin type: $type'),
  };

  await service.initState();
  runtime.setDio(service.dioCache);
  service.bus.on<HeadlessModeChanged>().listen((event) {
    runtime.setDio(service.dioCache);
  });

  await runtime.activateFetch();

  await runtime.evalAsync('__plugin._baseUrl = ${jsonEncode(service.baseUrl)}');

  return service;
}
