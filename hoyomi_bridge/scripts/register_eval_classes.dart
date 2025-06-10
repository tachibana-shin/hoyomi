import 'dart:io';

void main() {
  final dir = Directory.current;
  final files =
      dir
          .listSync(recursive: true)
          .where(
            (f) =>
                f is File &&
                f.path.endsWith('.eval.dart') &&
                !f.path.contains('generated'),
          )
          .cast<File>()
          .toList();

  final declarations = <String>[];
  final constructors = <String>[];

  for (final file in files) {
    if (file.path.contains('compiler')) continue;

    final content = file.readAsStringSync();
    final matches = RegExp(r'class (\$\w+)\b').allMatches(content);

    for (final match in matches) {
      final className = match.group(1)!;

      final path = file.uri
          .toFilePath()
          .replaceFirst('${Directory.current.path}/', '')
          .replaceAll('\\', '/');

      final dartUri =
          'package:hoyomi_bridge/' +
          path.replaceFirst('eval.', '').replaceFirst('lib/', '');

      declarations.add(
        '  compiler.defineBridgeClass($className.\$declaration);',
      );
      if (className.contains('Service')) continue;
      if (className.contains('Bridger')) continue;
      if (className.contains('AB')) continue;
      if (className.contains('TimeUtils')) continue;

      constructors.add(
        "  runtime.registerBridgeFunc('$dartUri', '${className.substring(1)}.', $className.\$new);",
      );
    }
  }

  final registerBuffer =
      StringBuffer()
        ..writeln('// GENERATED CODE - DO NOT MODIFY BY HAND\n')
        ..writeln('import \'export.dart\';')
        ..writeln('import \'package:dart_eval/dart_eval.dart\';')
        ..writeln('void registerEvalDeclarations(Compiler compiler) {')
        ..writeln(declarations.join('\n'))
        ..writeln('}\n')
        ..writeln('void registerEvalConstructors(Runtime runtime) {')
        ..writeln(constructors.join('\n'))
        ..writeln('}');

  final output = File('lib/register.dart');
  output.createSync(recursive: true);
  output.writeAsStringSync(registerBuffer.toString());

  // --- Add export_no_eval.dart ---
  final exportBuffer =
      StringBuffer()
        ..writeln('// GENERATED FILE - EXPORTS WITHOUT EVAL FILES\n');

  final libDir = Directory('lib');
  final exportable = libDir
      .listSync(recursive: true)
      .whereType<File>()
      .where(
        (file) =>
            file.path.endsWith('.dart') &&
            !file.path.contains('.eval.dart') &&
            !file.path.contains('.g.dart') &&
            !file.path.contains('.freezed.dart') &&
            !file.path.contains('.web.dart') &&
            !file.path.contains('.io.dart') &&
            !file.path.contains('generated') &&
            !file.path.contains('mixin') &&
            !file.path.contains('compiler') &&
            file.path != 'lib/export_no_eval.dart' &&
            file.path != 'lib/register.dart' &&
            file.path != 'lib/test.dart' &&
            file.path != 'lib/export.dart',
      );

  for (final file in exportable) {
    final relativePath = file.path
        .replaceFirst('lib/', '')
        .replaceAll('\\', '/');
    exportBuffer.writeln("export '$relativePath';");
  }

  final exportFile = File('lib/export_no_eval.dart');
  exportFile.createSync(recursive: true);
  exportFile.writeAsStringSync(exportBuffer.toString());
}
