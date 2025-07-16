import 'dart:convert';
import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/js_runtime/js_runtime.dart';
import 'package:hoyomi/js_runtime/webview_runtime.dart';

import 'install_js_service.dart';
import 'js_comic_service.dart';
import 'js_eiga_service.dart';

part 'create_js_service.freezed.dart';
part 'create_js_service.g.dart';

@freezed
sealed class JsServiceMeta with _$JsServiceMeta {
  const factory JsServiceMeta({
    required String type,
    required ServiceInit init,
    @JsonKey(name: '\$isAuth') required bool isAuth,
    String? writeWith,
  }) = _JsServiceMeta;

  factory JsServiceMeta.fromJson(Map<String, dynamic> json) =>
      _$JsServiceMetaFromJson(json);
}

Future<JsServiceMeta> _loadServiceMeta(File file) async {
  if (!await file.exists()) throw Exception('File doesn\'t exist $file');

  final initFile = getInitFileJsService(file);

  // もし .init ファイルが存在すれば、それを読み込む
  if (await initFile.exists()) {
    final meta = JsServiceMeta.fromJson(
      jsonDecode(await initFile.readAsString()),
    ); // ← initContentからServiceを作成する関数が必要

    return meta;
  }

  final runtime = await _getRuntime(await file.readAsString());
  final meta = await getMetaFromRuntime(runtime);

  try {
    await initFile.writeAsString(jsonEncode(meta));
  } finally {
    runtime.dispose();
  }

  return meta;
}

Future<JsRuntime> _getRuntime(String code) async {
  final runtime = WebviewRuntime();

  await runtime.init();

  await runtime.evalAsync('''(() => {$code;
      if (!globalThis.__\$HOYOMI_PLUGIN\$__) {
        throw Exception('No plugin found');
      }
      globalThis.__plugin = new globalThis.__\$HOYOMI_PLUGIN\$__();
    })();
  ''');

  return runtime;
}

Future<JsServiceMeta> getMetaFromRuntime(JsRuntime runtime) async {
  final type = await runtime.evalAsync('return __plugin.type');
  final init = ServiceInit.fromJson(
    await runtime.evalAsyncJson('return __plugin.init'),
  );
  final $isAuth =
      await runtime.evalAsyncJson('return __plugin.\$isAuth') ?? false;
  final writeWith =
      await runtime.evalAsyncJson('return __plugin.writeWith') as String?;

  final meta = JsServiceMeta(
    type: type,
    init: init,
    isAuth: $isAuth,
    writeWith: writeWith,
  );

  return meta;
}

Future<Service> createJsService({String? jsCode, File? file}) async {
  if (jsCode == null && file == null) {
    throw ArgumentError('Either \'jsCode\' or \'file\' is required');
  }

  late final JsServiceMeta meta;

  if (jsCode != null) {
    final runtime = await _getRuntime(jsCode);
    try {
      meta = await getMetaFromRuntime(runtime);
    } finally {
      runtime.dispose();
    }
  } else {
    meta = await _loadServiceMeta(file!);
  }

  final service = switch (meta.type) {
    == 'comic' => JSComicService(
      () async {
        if (jsCode != null) return _getRuntime(jsCode);
        return _getRuntime(await file!.readAsString());
      },
      meta.init,
      meta.isAuth,
      writeWith: meta.writeWith ?? 'js',
    ),
    == 'eiga' => JSEigaService(
      () async {
        if (jsCode != null) return _getRuntime(jsCode);
        return _getRuntime(await file!.readAsString());
      },
      meta.init,
      meta.isAuth,
      writeWith: meta.writeWith ?? 'js',
    ),
    _ => throw Exception('Unknown plugin type: ${meta.type}'),
  };

  await service.initState();

  return service;
}
