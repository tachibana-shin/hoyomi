// ignore_for_file: avoid_print

import 'dart:io';
import 'package:path/path.dart' as p;

void main() async {
  final root = Directory.current;

  final missingGFiles = <String>[];

  await for (final entity in root.list(recursive: true, followLinks: false)) {
    if (entity is File && entity.path.endsWith('.freezed.dart')) {
      final dir = p.dirname(entity.path);
      final baseName = p.basenameWithoutExtension(entity.path); // e.g. 'user.freezed'
      final fileStem = baseName.replaceAll('.freezed', '');     // e.g. 'user'

      final gFile = File(p.join(dir, '$fileStem.g.dart'));

      if (!gFile.existsSync()) {
        missingGFiles.add(p.join(dir, '$fileStem.dart'));
      }
    }
  }

  if (missingGFiles.isEmpty) {
    print('✅ All corresponding .g.dart files exist.');
  } else {
    print('⚠️ The following Dart files are missing their generated .g.dart files:');
    for (final path in missingGFiles) {
      print(' - $path');
    }
  }
}
