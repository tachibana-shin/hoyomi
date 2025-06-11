import 'dart:io';

import 'package:dart_eval/dart_eval.dart';
import 'package:path/path.dart';

import '../register.dart';
import '../utils/is_web.dart';

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
      'main.dart':
          await File(join(__dirname, 'export_no_eval.dart')).readAsString(),
      'export.dart': 'export \'main.dart\';',
    },
  });

  final runtime = Runtime.ofProgram(program);
  registerEvalConstructors(runtime);

  return runtime;
}
