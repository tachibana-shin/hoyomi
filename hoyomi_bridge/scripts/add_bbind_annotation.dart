import 'dart:io';
import 'package:path/path.dart' as p;

final freezedAnnotation = RegExp(r'@freezed(\s*)');
final importAnnotation =
    "import 'package:eval_annotation/eval_annotation.dart';";

void main(List<String> args) {
  if (args.isEmpty) {
    print('Usage: dart add_bbind_annotation.dart <directory>');
    exit(1);
  }

  final directory = Directory(args[0]);
  if (!directory.existsSync()) {
    print('❌ Directory not found: ${args[0]}');
    exit(1);
  }

  final dartFiles =
      directory
          .listSync(recursive: true)
          .where((f) => f is File && f.path.endsWith('.dart'))
          .cast<File>();

  for (final file in dartFiles) {
    _processFile(file);
  }

  print('✅ Done. All @freezed now followed by @Bind() with proper import.');
}

void _processFile(File file) {
  var content = file.readAsStringSync();

  final hasFreezed = content.contains('@freezed');
  final hasBBind = content.contains('@Bind');
  final hasImport = content.contains(importAnnotation);

  if (!hasFreezed) return;

  bool modified = false;

  // Add @Bind() if missing
  if (!hasBBind) {
    content = content.replaceAllMapped(
      freezedAnnotation,
      (match) => '@freezed${match.group(1)}@Bind()\n',
    );
    modified = true;
  }

  // Add import if missing
  if (!hasImport) {
    // Tìm vị trí sau dòng import cuối cùng
    final importMatches = RegExp(
      r"^import\s+['].+['];",
      multiLine: true,
    ).allMatches(content);
    if (importMatches.isNotEmpty) {
      final lastImport = importMatches.last;
      final insertPos = lastImport.end;
      content =
          content.substring(0, insertPos) +
          '\n$importAnnotation' +
          content.substring(insertPos);
    } else {
      // Không có import nào, chèn vào đầu file
      content = '$importAnnotation\n\n$content';
    }
    modified = true;
  }

  if (modified) {
    file.writeAsStringSync(content);
    print('🔧 Patched: ${file.path}');
  }
}
