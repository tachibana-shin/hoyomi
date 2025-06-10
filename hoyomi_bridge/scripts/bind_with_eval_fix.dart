import 'dart:io';

void main(List<String> args) async {
  if (args.isEmpty) {
    print('Usage: dart run bind_with_eval_fix_simple.dart <directory>');
    return;
  }

  final dir = Directory(args[0]);
  if (!dir.existsSync()) {
    print('❌ Directory does not exist: ${args[0]}');
    return;
  }

  final dartFiles =
      dir
          .listSync(recursive: true)
          .where((e) => e is File && e.path.endsWith('.dart'))
          .cast<File>();

  final modified = <File, String>{};

  for (final file in dartFiles) {
    if (file.path.contains('_service.dart')) continue;
    if (file.path.endsWith('bridger.dart')) continue;

    final content = file.readAsStringSync();
    // if (!content.contains('@Bind')) continue;

    final replaced = content
        .replaceAllMapped(RegExp(r'sealed class'), (m) => '/* sealed */ class')
        .replaceAllMapped(
          RegExp(r'abstract class'),
          (m) => '/* abstract */ class',
        );

    if (replaced != content) {
      modified[file] = content;
      file.writeAsStringSync(replaced);
      print('🔧 Patched: ${file.path}');
    }
  }

  print('🚀 Running: dart run eval:bind');
  final result = await Process.run('dart_eval', ['bind'], runInShell: true);
  stdout.write(result.stdout);
  stderr.write(result.stderr);

  for (final entry in modified.entries) {
    entry.key.writeAsStringSync(entry.value);
    print('♻️ Restored: ${entry.key.path}');
  }

  final urlSearchParamsEval = File(
    'lib/core_services/shared/url_search_params.eval.dart',
  );
  if (urlSearchParamsEval.existsSync()) {
    urlSearchParamsEval.writeAsString(
      // replace (args[0]?.$reified as Map?)?.cast() to (args[0]?.$reified as Map?)!.cast()
      urlSearchParamsEval.readAsStringSync().replaceAll(
        'args[0]?.\$reified as Map?',
        'args[0]?.\$reified!.cast()',
      ),
    );
  }

  print('🔧 Patched: url_search_params.eval.dart');

  print('✅ Done!');
}
