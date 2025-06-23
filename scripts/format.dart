// ignore_for_file: avoid_print

import 'dart:io';
import 'package:path/path.dart';

void main(List<String> args) async {
  final useExit = args.contains('--exit');

  final excludeDirs = ['.dart_tool', 'lib/general_api', 'build'];
  final excludedSuffixes = ['.g.dart', '.freezed.dart'];

  final dartFiles = <String>[];

  await for (final entity in Directory(join(Directory.current.path, 'lib')).list(
    recursive: true,
    followLinks: false,
  )) {
    if (entity is! File) continue;
    if (!entity.path.endsWith('.dart')) continue;

    final normalizedPath = entity.path.replaceAll('\\', '/');

    if (excludedSuffixes.any((suffix) => normalizedPath.endsWith(suffix))) {
      continue;
    }
    if (excludeDirs.any((dir) => normalizedPath.contains(dir))) continue;

    dartFiles.add(entity.path);
  }

  if (dartFiles.isEmpty) {
    print('No Dart files to format.');
    return;
  }

  final argsList = <String>['format'];
  if (useExit) argsList.add('--set-exit-if-changed');
  argsList.addAll(dartFiles);

  final result = await Process.run('dart', argsList);

  stdout.write(result.stdout);
  stderr.write(result.stderr);

  if (result.exitCode != 0) {
    exit(result.exitCode);
  }
}
