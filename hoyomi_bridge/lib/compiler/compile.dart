import 'dart:io';

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'package:dart_eval/stdlib/core.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:path/path.dart';

Future<Runtime> compile(Map<String, Map<String, String>> packages) async {
  final compiler = Compiler();
  registerEvalDeclarations(compiler);

  final __dirname = dirname(Platform.script.path);

  final program = compiler.compile({
    ...packages,
    'hoyomi_bridge': {
      'utils/is_web.dart': 'const isWeb = ${isWeb ? 'true' : 'false'};',
      'core_services/comic/interfaces/comic_modes.dart':
          await File(
            join(__dirname, 'core_services/comic/interfaces/comic_modes.dart'),
          ).readAsString(),
      'core_services/shared/status_enum.dart':
          await File(
            join(__dirname, 'core_services/shared/status_enum.dart'),
          ).readAsString(),
      'lib_eval.dart':
          await File(join(__dirname, 'compiler/lib_eval.dart')).readAsString(),
      'main.dart':
          await File(join(__dirname, 'export_no_eval.dart')).readAsString(),
      'export.dart': 'export \'main.dart\';',
    },
  });

  final runtime = Runtime.ofProgram(program);
  registerEvalConstructors(runtime);

  return runtime;
}

Future<void> installLibEval(
  Runtime runtime, {
  required String baseUrl,
  required Future<String> Function(
    String url, {
    String? cookie,
    UrlSearchParams? query,
    Map<String, dynamic>? body,
    Headers? headers,
    bool notify,
    bool headless,
    bool cache,
  })
  fetch,
}) async {
  final libEval = 'package:hoyomi_bridge/lib_eval.dart';

  await runtime.executeLib(libEval, 'setBaseUrl', [$String(baseUrl)]);
  await runtime.executeLib(libEval, 'setFetch', [
    $Closure((runtime, target, args) {
      print(args);
      return $Future.wrap(Future.value('ok'));
    }),
  ]);
  await runtime.executeLib(libEval, 'setParseQ', [
    $Closure((runtime, target, args) {
      return $DQuery.wrap(DQuery.fromHtml(args[0] as String));
    }),
  ]);
}
